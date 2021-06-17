import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/usecases/params.dart';
import '../domain/entities/shelf.dart';
import '../domain/usecases/get_shelf.dart';
import '../domain/usecases/store_shelf.dart';

part 'cabinet_state.dart';

//TODO : Create tests for cubit
class CabinetCubit extends Cubit<CabinetState> {
  final GetShelf getShelf;
  final StoreShelf storeShelf;

  CabinetCubit({
    required this.getShelf,
    required this.storeShelf,
  }) : super(CabinetInitial());

  Future<void> getShelfRun({
    required String shelfId,
    required String uid,
  }) async {
    emit(const CabinetLoading(message: OPERATION_MESSAGE_GET_SHELF));
    final failureOrShelf =
        await getShelf(ShelfParams(shelfId: shelfId, uid: uid));
    emit(failureOrShelf.fold(
        (failure) =>
            GetShelfError(message: failure.message, code: failure.code),
        (shelf) => GetShelfCompleted(shelf: shelf)));
  }

  Future<void> storeShelfRun({
    required Shelf shelf,
    required String uid,
  }) async {
    emit(const CabinetLoading(message: OPERATION_MESSAGE_STORE_SHELF));
    final failureOrStore = await storeShelf(ShelfParams(
      shelfId: shelf.shelfId,
      uid: uid,
      shelf: shelf,
    ));

    emit(failureOrStore.fold(
      (failure) =>
          StoreShelfError(message: failure.message, code: failure.code),
      (_) => StoreShelfCompleted(),
    ));
  }
}
