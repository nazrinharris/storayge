import 'package:hive/hive.dart';

import '../../../constants/app_const.dart';
import '../../../errors/exceptions.dart';
import '../models/storayge_user_model.dart';

abstract class IAuthLocalDataSource {
  Future<StoraygeUserModel> getCachedStoraygeUser();
  Future<void> cacheStoraygeUser(StoraygeUserModel storaygeUserToCache);
  Future<bool> isFirstTimeOpeningApp();
  Future<StoraygeUserModel> getCurrentUser();
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final HiveInterface hiveInterface;

  AuthLocalDataSource({
    required this.hiveInterface,
  });

  @override
  Future<StoraygeUserModel> getCachedStoraygeUser() async {
    /// Precaution to ensure that [STORAYGE_USER_BOX] has been opened.
    ///
    /// If the box, is in fact not opened, Hive will just return the box since
    /// the box is a Singleton. I think.
    final box = await hiveInterface.openBox(HIVE_BOX_STORAYGE_USER);

    /// The [StoraygeUserModel] that is kept inside the box should ALWAYS be
    /// in the [HIVE_KEY] entry. It will act as a default user and also avoid
    /// complications.
    ///
    /// This practice may also allow for users to sign in with multiple accounts.
    final StoraygeUserModel? retrievedUser =
        await box.get(HIVE_KEY_STORAYGE_USER);

    if (retrievedUser != null) {
      return retrievedUser;
    } else {
      throw CacheException();
    }
  }

// TODO: Create tests
  @override
  Future<void> cacheStoraygeUser(
      StoraygeUserModel storaygeUserModelToCache) async {
    final box = await hiveInterface.openBox(HIVE_BOX_STORAYGE_USER);
    return box.put(HIVE_KEY_STORAYGE_USER, storaygeUserModelToCache);
  }

  @override
  Future<bool> isFirstTimeOpeningApp() async {
    final box = await hiveInterface.openBox(HIVE_BOX_STORAYGE_USER);
    final isFirstTimeOpeningApp = box.get(HIVE_KEY_IS_FIRST_TIME_OPENING_APP);

    return isFirstTimeOpeningApp ?? false;
  }

  @override
  Future<StoraygeUserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
