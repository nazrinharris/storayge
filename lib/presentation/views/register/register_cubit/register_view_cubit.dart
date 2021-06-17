import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

part 'register_view_state.dart';

class RegisterViewCubit extends Cubit<RegisterViewState> {
  late PageController pageController;

  RegisterViewCubit({
    required this.pageController,
  }) : super(RegisterViewFirstPage());

  void triggerFirstPage() {
    pageController.animateToPage(
      0,
      duration: 750.milliseconds,
      curve: Curves.easeOutExpo,
    );
    emit(RegisterViewFirstPage());
  }

  void triggerSecondPage() {
    pageController.animateToPage(
      1,
      duration: 750.milliseconds,
      curve: Curves.easeOutExpo,
    );
    emit(RegisterViewSecondPage());
  }
}
