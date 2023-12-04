import 'package:christmas_postcard/model/user_model.dart';
import 'package:christmas_postcard/providers/user/user_state.dart';
import 'package:christmas_postcard/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:state_notifier/state_notifier.dart';

class UserProvider extends StateNotifier<UserState> with LocatorMixin {
  UserProvider() : super(UserState.init());

  Future<void> getUserInfo() async {
    try {
      String uid = read<User>().uid;
      UserModel userModel = await read<UserRepository>().getUserInfo(uid: uid);
      state = state.copyWith(userModel: userModel);
    } catch (_) {
      rethrow;
    }
  }
}
