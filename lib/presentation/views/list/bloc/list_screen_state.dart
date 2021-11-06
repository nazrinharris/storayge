part of 'list_screen_bloc.dart';

@freezed
class ListScreenState with _$ListScreenState {
  const factory ListScreenState.initial() = LSInitial;
  const factory ListScreenState.loading({
    required String currentOperationMessage,
    String? code,
  }) = LSLoading;
  const factory ListScreenState.loadedAllListSGSnip(
      List<StoraygeGroupSnippet> allListSgSnip) = LSLoadedAllListSGSnip;
  const factory ListScreenState.error({
    required String message,
    required String code,
  }) = LSError;
}
