// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:christmas_postcard/model/user_model.dart';

enum UserStatus {
  init,
  fetching,
  success,
  error,
}

class UserState {
  final UserStatus userStatus;
  final UserModel userModel;

  UserState({
    required this.userStatus,
    required this.userModel,
  });

  factory UserState.init() {
    return UserState(
      userStatus: UserStatus.init,
      userModel: UserModel.init(),
    );
  }

  UserState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
  }) {
    return UserState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  String toString() =>
      'UserState(userStatus: $userStatus, userModel: $userModel)';
}
