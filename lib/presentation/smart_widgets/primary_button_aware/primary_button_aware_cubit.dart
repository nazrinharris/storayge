import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';
import 'package:supercharged/supercharged.dart';

part 'primary_button_aware_state.dart';
part 'primary_button_aware_cubit.freezed.dart';
part 'primary_button_aware.dart';

/// Guide on using [PrimaryButtonAware]
///
/// This widget is basically an [ElevatedButton] which is somewhat aware of the state of the screen.
/// It's structure (aside from the state awareness) should and must follow [PrimaryButton] - [Storayge]
/// Note : Although this widget is named 'aware', the awareness of it must be set by another
/// presentation logic controller.
///
/// REMEMBER :- Provide the [PrimaryButtonAwareCubit] to one of it's ancestors. Use [Builder] if
/// you can't access the cubit eventhough it has been provided.
///
/// It's state change is done through the use of it's public methods :
///
/// [triggerLoading()]
/// Call this method when you want to update the button's state to loading.
///
/// [triggerFirstPage()]
/// Call this method when you want to update the button's state to what you have
/// set for the first page.
///
/// [triggerSecondPage()]
/// By now you should now what this does.
///
/// [triggerThirdPage()]
/// Same with this.
///
/// By default, you must provide the arguments for the first and second pages. This widget currently
/// supports up to three pages, but newer versions may be made to support even more pages.
///
/// Caution! : If you are not utilising [triggerThirdPage] do NOT use it at all. Unnecesarry calls
/// on the method will at best, cause unexpected behaviour and at worst, crash the app. Tbh i never tried.
///
/// Upon it's creation, this cubit will emit [_stateInitialPage]
///
/// [states] of this button should not be listened to or taken notice of. This widget's state
/// should depend on an outside source.
///
/// TODO: Implement thirdPageButton feature
/// TODO: Implement tests. If possible
class PrimaryButtonAwareCubit extends Cubit<PrimaryButtonAwareState> {
  PrimaryButtonAwareCubit()
      : super(const PrimaryButtonAwareState.initialPage());

  // Public methods that can be called to manage the button's states.
  void triggerLoading() {
    emit(const PrimaryButtonAwareState.loading());
  }

  void triggerFirstPage() {
    emit(const PrimaryButtonAwareState.initialPage());
  }

  void triggerSecondPage() {
    emit(const PrimaryButtonAwareState.secondPage());
  }

  void triggerThirdPage() {
    emit(const PrimaryButtonAwareState.thirdPage());
  }
}
