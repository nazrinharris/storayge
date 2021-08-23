import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:supercharged/supercharged.dart';

part 'register_view_state.dart';

RegisterViewCubit readRegisterViewCubit(BuildContext context) =>
    BlocProvider.of<RegisterViewCubit>(context);

RegisterViewCubit watchRegisterViewCubit(BuildContext context) =>
    BlocProvider.of<RegisterViewCubit>(context, listen: true);

class RegisterViewCubit extends Cubit<RegisterViewState> {
  final AuthCubit authCubit;

  late PageController pageController;
  late double? currentPageValue;
  late double firstPageOpacity;
  late double secondPageOpacity;
  late int currentPageIndex;

  RegisterViewCubit({
    required this.pageController,
    required this.authCubit,
  }) : super(
          RegisterViewFirstPage(),
        ) {
    listenToPageController();
    currentPageValue = 0;
    currentPageIndex = 0;
    firstPageOpacity = 1.0;
    secondPageOpacity = 0.0;
  }

  void triggerFirstPage() {
    animateToFirstPage();
    emit(
      RegisterViewFirstPage(),
    );
  }

  void triggerSecondPage() {
    pageController.animateToPage(
      1,
      duration: 750.milliseconds,
      curve: Curves.easeOutExpo,
    );
    currentPageIndex = 1;
    firstPageOpacity = 0.0;
    secondPageOpacity = 1.0;
    emit(RegisterViewSecondPage());
  }

  void animateToFirstPage() {
    pageController.animateToPage(
      0,
      duration: 750.milliseconds,
      curve: Curves.easeOutExpo,
    );
    currentPageIndex = 0;
    firstPageOpacity = 1.0;
    secondPageOpacity = 0.0;
  }

  void listenToPageController() {
    pageController.addListener(() {
      currentPageValue = pageController.page;
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
