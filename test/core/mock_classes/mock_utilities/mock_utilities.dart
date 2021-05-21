import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/network/network_info.dart';

@GenerateMocks([
  StoraygeUserModel,
  NetworkInfo,
  InternetConnectionChecker,
])
class MockUtilities {}
