import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storayge/features/cabinet/domain/i_repository/i_cabinet_repository.dart';

part 'cabinet_state.dart';

//TODO : Create tests for cubit
class CabinetCubit extends Cubit<CabinetState> {
  late ICabinetRepository cabinetRepository;

  CabinetCubit({
    required this.cabinetRepository,
  }) : super(CabinetInitial());
}
