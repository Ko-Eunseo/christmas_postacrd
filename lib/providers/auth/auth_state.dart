// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus authStatus;

  AuthState({
    required this.authStatus,
  });

  factory AuthState.init() {
    return AuthState(
      authStatus: AuthStatus.unauthenticated,
    );
  }

  AuthState copyWith({
    AuthStatus? authStatus,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  String toString() => 'AuthState(authStatus: $authStatus)';
}
