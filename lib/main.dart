import 'package:christmas_postcard/firebase_options.dart';
import 'package:christmas_postcard/providers/auth/auth_state.dart';
import 'package:christmas_postcard/repository/auth_repository.dart';
import 'package:christmas_postcard/view/pages/login_page.dart';
import 'package:christmas_postcard/view/pages/signup_page.dart';
import 'package:christmas_postcard/view/pages/splash_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'providers/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();

    return MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (context) {
            return AuthRepository(
              firebaseAuth: FirebaseAuth.instance,
              firebaseStorage: FirebaseStorage.instance,
              firebaseFirestore: FirebaseFirestore.instance,
            );
          },
        ),
        // 접속상태를 실시간으로 받음
        StreamProvider<User?>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        StateNotifierProvider<AuthProvider, AuthState>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: const MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
