import 'package:christmas_postcard/providers/auth/auth_state.dart';
import 'package:christmas_postcard/repository/auth_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.init());

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
