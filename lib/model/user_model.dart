class UserModel {
  final String uid;
  final String name;
  final String email;
  final int receiving;
  final List<String> postcard;
  final List<String> receivedCards;
  final List<String> friends;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.receiving,
    required this.postcard,
    required this.receivedCards,
    required this.friends,
  });

  factory UserModel.init() {
    return const UserModel(
      uid: '',
      name: '',
      email: '',
      receiving: 0,
      postcard: [],
      receivedCards: [],
      friends: [],
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    int? receiving,
    List<String>? postcard,
    List<String>? receivedCards,
    List<String>? friends,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      receiving: receiving ?? this.receiving,
      postcard: postcard ?? this.postcard,
      receivedCards: receivedCards ?? this.receivedCards,
      friends: friends ?? this.friends,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      receiving: map['receiving'],
      postcard: List<String>.from((map['postcard'])),
      receivedCards: List<String>.from((map['receivedCards'])),
      friends: List<String>.from((map['friends'])),
    );
  }
}
