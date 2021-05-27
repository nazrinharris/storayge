import 'package:hive/hive.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';

import '../models/storayge_user_model.dart';

abstract class AuthLocalDataSource {
  Future<StoraygeUserModel> getCachedStoraygeUser();
  Future<void> cacheStoraygeUser(StoraygeUserModel storaygeUserToCache);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final HiveInterface hiveInterface;

  AuthLocalDataSourceImpl({
    required this.hiveInterface,
  });

  @override
  Future<StoraygeUserModel> getCachedStoraygeUser() async {
    /// Precaution to ensure that [STORAYGE_USER_BOX] has been opened.
    ///
    /// If the box, is in fact not opened, Hive will just return the box since
    /// the box is a Singleton. I think.
    final box = await hiveInterface.openBox(STORAYGE_USER_BOX);

    /// The [StoraygeUserModel] that is kept inside the box should ALWAYS be
    /// in the 0th entry. It will act as a default user and also avoid
    /// complications.
    ///
    /// This practice may also allow for users to sign in with multiple accounts.
    final StoraygeUserModel? retrievedUser =
        await box.getAt(STORAYGE_USER_ENTRY);

    if (retrievedUser != null) {
      return retrievedUser;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheStoraygeUser(
      StoraygeUserModel storaygeUserModelToCache) async {
    /// Precaution to ensure that [STORAYGE_USER_BOX] has been opened.
    ///
    /// If the box, is in fact not opened, Hive will just return the box since
    /// the box is a Singleton. I think.
    final box = await hiveInterface.openBox(STORAYGE_USER_BOX);
    return box.put(STORAYGE_USER_ENTRY, storaygeUserModelToCache);
  }
}
