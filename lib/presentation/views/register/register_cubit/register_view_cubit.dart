import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

part 'register_view_state.dart';

class RegisterViewCubit extends Cubit<RegisterViewState> {
  late PageController pageController;
  late double? currentPageValue;
  late double firstPageOpacity;
  late double secondPageOpacity;
  late int currentPageIndex;

  late String usernameValue;
  late String emailValue;

  late FocusNode usernameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  RegisterViewCubit({
    required this.pageController,
    required this.usernameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  }) : super(
          const RegisterViewFirstPage(
            usernameValue: '',
            emailValue: '',
            passwordValue: '',
            confirmPasswordValue: '',
          ),
        ) {
    currentPageValue = 0;
    currentPageIndex = 0;
    pageController.addListener(() {
      currentPageValue = pageController.page;
    });
    firstPageOpacity = 1.0;
    secondPageOpacity = 0.0;
  }

  void triggerFirstPage() {
    pageController.animateToPage(
      0,
      duration: 750.milliseconds,
      curve: Curves.easeOutExpo,
    );
    currentPageIndex = 0;
    firstPageOpacity = 1.0;
    secondPageOpacity = 0.0;
    emit(
      const RegisterViewFirstPage(
        usernameValue: '',
        emailValue: '',
        passwordValue: '',
        confirmPasswordValue: '',
      ),
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

  void triggerAllNodesUnfocus() {
    usernameFocusNode.unfocus();
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
  }

  @override
  Future<void> close() {
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}
