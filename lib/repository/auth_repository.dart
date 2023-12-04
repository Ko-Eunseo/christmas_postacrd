import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    email,
    name,
    password,
  }) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;
    await userCredential.user!.sendEmailVerification();

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
}
