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

  late GlobalKey<FormState> firstPageFormKey;
  late GlobalKey<FormState> secondPageFormKey;

  late bool isFirstInteractionWithUsernameField;
  late bool isFirstInteractionWithEmailField;

  late FocusNode usernameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  late String? usernameValue;
  late String? emailValue;
  late String? passwordValue;
  late String? confirmPasswordValue;

  late AutovalidateMode autovalidateModeUsernameField;
  late AutovalidateMode autovalidateModeEmailField;

  RegisterViewCubit({
    required this.pageController,
    required this.usernameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
    required this.authCubit,
    required this.firstPageFormKey,
    required this.secondPageFormKey,
  }) : super(
          const RegisterViewFirstPage(
            usernameValue: '',
            emailValue: '',
          ),
        ) {
    listenToPageController();
    currentPageValue = 0;
    currentPageIndex = 0;
    firstPageOpacity = 1.0;
    secondPageOpacity = 0.0;
    usernameValue = null;
    emailValue = null;
    passwordValue = null;
    confirmPasswordValue = null;
    isFirstInteractionWithUsernameField = true;
    isFirstInteractionWithEmailField = true;
    autovalidateModeUsernameField = AutovalidateMode.disabled;
    autovalidateModeEmailField = AutovalidateMode.disabled;
  }

  void triggerFirstPage() {
    animateToFirstPage();
    emit(
      RegisterViewFirstPage(
        usernameValue: usernameValue,
        emailValue: emailValue,
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
    emit(RegisterViewSecondPage(
      passwordValue: passwordValue,
      confirmPasswordValue: confirmPasswordValue,
    ));
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

  bool validateFirstForm() {
    bool validationResult = firstPageFormKey.currentState!.validate();
    return validationResult;
  }

  void validateUsernameField() {
    autovalidateModeUsernameField = AutovalidateMode.always;
  }

  void validateEmailField() {
    autovalidateModeEmailField = AutovalidateMode.always;
  }

  void toggleIsFirstInteractionWithUsernameField() {
    isFirstInteractionWithUsernameField = false;
  }

  void focusOnEmailTextField() {
    emailFocusNode.requestFocus();
  }

  void listenToPageController() {
    pageController.addListener(() {
      currentPageValue = pageController.page;
    });
  }

  void triggerAllNodesUnfocus() {
    usernameFocusNode.unfocus();
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
  }

  void triggerUsernameAndOrEmailValueChanged({
    String? newUsernameValue,
    String? newEmailValue,
  }) {
    if (newUsernameValue == null) {
      emailValue = newEmailValue!;
    } else if (newEmailValue == null) {
      usernameValue = newUsernameValue;
    } else {
      usernameValue = newUsernameValue;
      emailValue = newEmailValue;
    }
  }

  void triggerPasswordAndOrConfirmPasswordValueChanged({
    String? newPasswordValue,
    String? newConfirmPasswordValue,
  }) {
    if (newPasswordValue == null) {
      confirmPasswordValue = newConfirmPasswordValue;
    } else if (newConfirmPasswordValue == null) {
      passwordValue = newPasswordValue;
    } else {
      passwordValue = newPasswordValue;
      confirmPasswordValue = newConfirmPasswordValue;
    }
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
