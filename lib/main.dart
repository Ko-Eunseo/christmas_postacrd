import 'package:christmas_postcard/firebase_options.dart';
import 'package:christmas_postcard/providers/auth/auth_state.dart';
import 'package:christmas_postcard/providers/postcard/postcard_provider.dart';
import 'package:christmas_postcard/providers/postcard/postcard_state.dart';
import 'package:christmas_postcard/providers/sticker/sticker_provider.dart';
import 'package:christmas_postcard/providers/sticker/sticker_state.dart';
import 'package:christmas_postcard/providers/user/user_provider.dart';
import 'package:christmas_postcard/providers/user/user_state.dart';
import 'package:christmas_postcard/repository/auth_repository.dart';
import 'package:christmas_postcard/repository/user_repository.dart';
import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:christmas_postcard/view/pages/edit_tree_page.dart';
import 'package:christmas_postcard/view/pages/my_page.dart';
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
        Provider<UserRepository>(
          create: (context) {
            return UserRepository(
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
        StateNotifierProvider<UserProvider, UserState>(
          create: (context) => UserProvider(),
        ),
        StateNotifierProvider<StickerProvider, StickerState>(
          create: (context) => StickerProvider(),
        ),
        StateNotifierProvider<PostcardProvider, PostcardState>(
          create: (context) => PostcardProvider(),
        ),
      ],
      child: MaterialApp(
        // home: const SplashPage(),
        home: const EditTreePage(),
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: AppColors.blackColor,
            ),
            bodySmall: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            background: AppColors.background,
            brightness: Brightness.light,
            seedColor: AppColors.redColor,
          ),
        ),
      ),
    );
  }
}
