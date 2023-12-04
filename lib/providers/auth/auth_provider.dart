import 'package:christmas_postcard/providers/auth/auth_state.dart';
import 'package:christmas_postcard/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.init());
  //auth 상태
  @override
  void update(Locator watch) {
    final user = watch<User?>();

    if (user == null && state.authStatus == AuthStatus.unauthenticated) return;

    if (user != null) {
      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
      );
    } else {
      state = state.copyWith(
        authStatus: AuthStatus.unauthenticated,
      );
    }
  }

  Future<void> signinWithGoogle(context) async {
    try {
      await read<AuthRepository>().signinWithGoogle(context);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await read<AuthRepository>().signin(
        email: email,
        password: password,
      );

      print('로그인 성공');
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      await read<AuthRepository>().signup(
        email: email,
        name: name,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }
}
