import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class StoraygeUser extends Equatable {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String uid;

  const StoraygeUser({
    required this.username,
    required this.email,
    required this.uid,
  });

  @override
  List<Object?> get props => [username, email, uid];
}
