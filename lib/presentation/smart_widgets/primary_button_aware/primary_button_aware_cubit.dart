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
