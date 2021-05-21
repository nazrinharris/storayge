import 'package:mockito/annotations.dart';
import 'package:storayge/core/auth/data/datasources/auth_local_data_source.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart';
import 'package:storayge/core/auth/domain/repository/auth_repository.dart';

@GenerateMocks([
  AuthRepository,
  AuthRepositoryImpl,
  AuthRemoteDataSource,
  AuthLocalDataSource,
])
class MockAppAuth {}
