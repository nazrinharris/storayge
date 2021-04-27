import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:storayge/api/firestore_api.dart';
import 'package:storayge/app/app.locator.dart';
import 'package:storayge/app/app.logger.dart';
import 'package:storayge/models/application_models.dart';

class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _currentUser;

  User get currentUser => _currentUser!;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(uid: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create new user...');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }
}
