import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/features/cabinet/domain/i_repository/i_cabinet_repository.dart';

part 'cabinet_state.dart';
part 'cabinet_cubit.freezed.dart';

class CabinetCubit extends Cubit<CabinetState> {
  final ICabinetRepository cabinetRepository;

  CabinetCubit({
    required this.cabinetRepository,
  }) : super(const CabinetState.initial());

  //todo: tests baby
  Future<void> execGetAllList({required String uid}) async {
    emit(const CabinetState.loading(
      currentOperationMessage: 'Retrieving your groups..',
      code: 'EXEC_GET_ALL_LIST',
    ));

    final failureOrList = await cabinetRepository.getAllListSGSnip(uid: uid);

    emit(failureOrList.fold(
      (failure) => CabinetState.getAllListSGSnipError(
        message: failure.message ?? "No message was provided",
        code: failure.code ?? "No code was provided",
      ),
      (list) => CabinetState.getAllListSGSnipLoaded(allListSGSnip: list),
    ));
  }
}
