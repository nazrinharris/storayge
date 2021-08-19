import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/repository/cabinet_repository.dart';
import 'package:storayge/features/cabinet/domain/i_repository/i_cabinet_repository.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/usecases/params.dart';

part 'cabinet_state.dart';

//TODO : Create tests for cubit
class CabinetCubit extends Cubit<CabinetState> {
  late ICabinetRepository cabinetRepository;

  CabinetCubit({
    required this.cabinetRepository,
  }) : super(CabinetInitial());

  // Future<void> getShelfRun({
  //   required String shelfId,
  //   required String uid,
  // }) async {
  //   emit(const CabinetLoading(message: OPERATION_MESSAGE_GET_SHELF));
  //   final failureOrShelf =
  //       await cabinetRepository.getShelf(shelfId: shelfId, uid: uid);
  //   emit(failureOrShelf.fold(
  //       (failure) =>
  //           GetShelfError(message: failure.message, code: failure.code),
  //       (shelf) => GetShelfCompleted(shelf: shelf)));
  // }

  // Future<void> storeShelfRun({
  //   required Shelf shelf,
  //   required String uid,
  // }) async {
  //   emit(const CabinetLoading(message: OPERATION_MESSAGE_STORE_SHELF));
  //   final failureOrStore = await cabinetRepository.storeShelf(
  //     shelf: shelf,
  //     uid: uid,
  //   );

  //   emit(failureOrStore.fold(
  //     (failure) =>
  //         StoreShelfError(message: failure.message, code: failure.code),
  //     (_) => StoreShelfCompleted(),
  //   ));
  // }
}
