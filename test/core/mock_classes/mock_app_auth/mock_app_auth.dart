import 'package:mockito/annotations.dart';
import 'package:storayge/core/auth/data/datasources/auth_local_data_source.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart';
import 'package:storayge/core/auth/domain/repository/auth_repository.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'package:storayge/core/auth/domain/usecases/get_uid.dart';
import 'package:storayge/core/auth/domain/usecases/login_with_email_and_password.dart';
import 'package:storayge/core/auth/domain/usecases/register_with_email_and_password.dart';

@GenerateMocks([
  AuthRepository,
  AuthRepositoryImpl,
  AuthRemoteDataSource,
  AuthLocalDataSource,
  GetStoraygeUserDataFromRemote,
  LoginWithEmailAndPassword,
  RegisterWithEmailAndPassword,
  GetUid,
])
class MockAppAuth {}
