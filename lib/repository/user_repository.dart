import 'package:christmas_postcard/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore firebaseFirestore;

  const UserRepository({
    required this.firebaseFirestore,
  });

  Future<UserModel> getUserInfo({
    required String uid,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firebaseFirestore.collection('users').doc(uid).get();
      return UserModel.fromMap(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }
}
