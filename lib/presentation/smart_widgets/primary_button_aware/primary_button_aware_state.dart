part of 'primary_button_aware_cubit.dart';

const PrimaryButtonAwareState _stateLoading = PrimaryButtonAwareState.loading();
const PrimaryButtonAwareState _stateInitialPage =
    PrimaryButtonAwareState.initialPage();
const PrimaryButtonAwareState _stateSecondPage =
    PrimaryButtonAwareState.secondPage();
const PrimaryButtonAwareState _stateThirdPage =
    PrimaryButtonAwareState.thirdPage();

@freezed
abstract class PrimaryButtonAwareState with _$PrimaryButtonAwareState {
  const factory PrimaryButtonAwareState.initialPage() = _InitialPage;
  const factory PrimaryButtonAwareState.secondPage() = _SecondPage;
  const factory PrimaryButtonAwareState.thirdPage() = _ThirdPage;
  const factory PrimaryButtonAwareState.loading() = _Loading;
}
