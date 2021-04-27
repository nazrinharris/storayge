import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storayge/app/app.logger.dart';
import 'package:storayge/exceptions/firestore_api_exception.dart';
import 'package:storayge/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.uid);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String uid}) async {
    log.i('userId:$uid');

    if (uid.isNotEmpty) {
      final userDoc = await usersCollection.doc(uid).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $uid in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return User.fromJson(userData!);
    } else {
      throw FirestoreApiException(
        message:
            'Your uid passed is empty. Please pass in a valid user if from your Firebase user',
      );
    }
  }
}
