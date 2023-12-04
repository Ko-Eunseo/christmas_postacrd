import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firebaseFirestore;

  AuthRepository({
    required this.firebaseAuth,
    required this.firebaseStorage,
    required this.firebaseFirestore,
  });

  Future<void> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;
    await firebaseFirestore.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'receiving': 0,
      'postcard': [],
      'receivedCards': [],
      'friends': [],
    });

    // 회원가입과 동시에 로그인을 시도하기때문에 로그아웃해주어야함.
    firebaseAuth.signOut();
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication authentication =
            await account.authentication;
        OAuthCredential googleCredential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken,
        );
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(googleCredential);
        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;

          await firebaseFirestore.collection('users').doc(uid).set({
            'uid': uid,
            'email': userCredential.user!.email,
            'name': userCredential.user!.displayName,
            'receiving': 0,
            'postcard': [],
            'receivedCards': [],
            'friends': [],
          });
        }
      }
    } catch (error) {
      print("Google Sign-In Error: $error");
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    bool isVerified = userCredential.user!.emailVerified;

    if (!isVerified) {
      await userCredential.user!.sendEmailVerification();
      await firebaseAuth.signOut();
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
