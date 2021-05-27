import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../network_info.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkInfo networkInfo;

  NetworkCubit({
    required this.networkInfo,
  }) : super(NetworkLoading());
}
