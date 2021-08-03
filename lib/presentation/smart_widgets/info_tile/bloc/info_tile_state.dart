part of 'info_tile_bloc.dart';

@freezed
class InfoTileState with _$InfoTileState {
  const factory InfoTileState.invisible(InfoTileProps infoTileProps) =
      _Invisible;

  const factory InfoTileState.loading(InfoTileProps infoTileProps) = _Loading;
  const factory InfoTileState.loadingExpanded(InfoTileProps infoTileProps) =
      _LoadingExpanded;
  const factory InfoTileState.success(InfoTileProps infoTileProps) = _Success;
  const factory InfoTileState.successExpanded(InfoTileProps infoTileProps) =
      _SuccessExpanded;
  const factory InfoTileState.failure(InfoTileProps infoTileProps) = _Failure;
  const factory InfoTileState.failureExpanded(InfoTileProps infoTileProps) =
      _FailureExpanded;
}

@freezed
class InfoTileProps with _$InfoTileProps {
  const factory InfoTileProps({
    required String leadingText,
    required Widget child,
    required bool isAbleToExpand,
    required bool isExpanded,
    required InfoTileStatus currentStatus,
    AnimationController? animationController,
  }) = _InfoTileProps;
}
