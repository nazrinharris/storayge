part of 'cabinet_cubit.dart';

@freezed
class CabinetState with _$CabinetState {
  const factory CabinetState.initial() = _Initial;
  const factory CabinetState.loading({
    required String currentOperationMessage,
    required String code,
  }) = CabinetLoading;

  //* execGetAllListSGSnip()
  const factory CabinetState.getAllListSGSnipLoaded({
    required List<StoraygeGroupSnippet> allListSGSnip,
  }) = CabinetLoadedGetAllListSGSnip;
  const factory CabinetState.getAllListSGSnipError({
    required String message,
    required String code,
  }) = CabinetErrorGetAllListSGSnip;
}
