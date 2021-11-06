import 'package:hive/hive.dart';

import '../../domain/entities/storayge_user.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class StoraygeUserModel extends StoraygeUser with HiveObjectMixin {
  StoraygeUserModel({
    required String uid,
    required String username,
    required String email,
  }) : super(
          uid: uid,
          username: username,
          email: email,
        );

  factory StoraygeUserModel.fromJson(Map<String, dynamic>? json) {
    return StoraygeUserModel(
      uid: json!['uid'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
    };
  }
}
