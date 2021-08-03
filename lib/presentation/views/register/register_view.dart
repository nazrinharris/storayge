import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/bloc/info_tile_bloc.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/info_tile.dart';
import 'package:storayge/presentation/smart_widgets/primary_button_aware/primary_button_aware_cubit.dart';
import 'package:storayge/presentation/smart_widgets/two_fields_form.dart/two_fields_form_bloc.dart';
import 'package:storayge/presentation/views/register/register_cubit/register_view_cubit.dart';
import 'package:supercharged/supercharged.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with AnimationMixin {
  late AnimationController _infoTileVisibilityController;
  late Animation<double> _infoTileHeightFactor;
  late Animation<double> _infoTileOpacity;
  late CurvedAnimation _infoTileCurve;

  @override
  void initState() {
    super.initState();
    _infoTileVisibilityController = createController();

    _infoTileCurve = CurvedAnimation(
      parent: _infoTileVisibilityController,
      curve: Curves.easeOutExpo,
      reverseCurve: Curves.easeInExpo,
    );

    _infoTileHeightFactor =
        Tween<double>(begin: 0.0, end: 1.0).animate(_infoTileCurve);
    _infoTileOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_infoTileCurve);
  }

  void showInfoTile() {
    _infoTileVisibilityController.play(duration: 500.milliseconds);
  }

  void hideInfoTile() {
    _infoTileVisibilityController.playReverse(duration: 500.milliseconds);
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    bool isVisible = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TwoPaginationProgressCubit(
                  screenHeight: 1.sh,
                  screenWidth: 1.sw,
                )),
        BlocProvider(
            create: (context) => RegisterViewCubit(
                  authCubit: context.read<AuthCubit>(),
                  pageController: pageController,
                )),
        BlocProvider<PrimaryButtonAwareCubit>(
            create: (context) => PrimaryButtonAwareCubit()),
        BlocProvider<FirstTwoFieldsFormBloc>(
            create: (context) => TwoFieldsFormBloc()),
        BlocProvider<SecondTwoFieldsFormBloc>(
            create: (context) => TwoFieldsFormBloc()),
        BlocProvider(
          create: (context) => InfoTileBloc(
            infoTileProps: const InfoTileProps(
              leadingText: 'No operation running',
              child: Text(
                  'In all seriousness, you should never have seen this text. Like how did you even get here?'),
              isAbleToExpand: true,
              isExpanded: false,
              currentStatus: InfoTileStatus.loading,
            ),
          ),
        ),
      ],
      child: Builder(
        builder: (context) => WillPopScope(
          onWillPop: () async {
            if (readRegisterViewCubit(context).currentPageIndex == 0) {
              Navigator.of(context).pop();
              return true;
            } else {
              readRegisterViewCubit(context).triggerFirstPage();
              context.read<TwoPaginationProgressCubit>().triggerFirstPage();
              context.read<PrimaryButtonAwareCubit>().triggerFirstPage();
              hideInfoTile();
              return false;
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: AppBarWithTwoPaginationProgress(
              twoPaginationProgress: buildTwoPaginationProgress(1.sw),
              backButton: () {
                readFirstFormBloc(context).add(unfocusAllNodes);
                readSecondFormBloc(context).add(unfocusAllNodes);
                context.read<TwoPaginationProgressCubit>().triggerFirstPage();
                context.read<PrimaryButtonAwareCubit>().triggerFirstPage();
                context.read<RegisterViewCubit>().triggerFirstPage();
                hideInfoTile();
              },
              closeButton: () {
                readFirstFormBloc(context).add(unfocusAllNodes);
                readSecondFormBloc(context).add(unfocusAllNodes);
                Navigator.of(context).pop();
              },
            ),
            body: Stack(
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 1.sh,
                      width: 1.sw,
                      child: SafeArea(
                        left: false,
                        right: false,
                        child: Builder(
                          builder: (context) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Align(
                                  heightFactor: _infoTileHeightFactor.value,
                                  child: Opacity(
                                    opacity: _infoTileOpacity.value,
                                    child: const InfoTile(),
                                  ),
                                ),
                              ),
                              verticalSpace24,
                              Expanded(
                                child: PageView.builder(
                                  controller: context
                                      .read<RegisterViewCubit>()
                                      .pageController,
                                  itemCount: 2,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return _BuildPageContent(
                                      index: index,
                                      onPressedThirdPartyButton: () {
                                        if (isVisible) {
                                          isVisible = !isVisible;
                                          hideInfoTile();
                                        } else {
                                          isVisible = !isVisible;
                                          showInfoTile();
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.058.sw),
                        child: _BuildBottomButtons(
                          showInfoTile: showInfoTile,
                          hideInfoTile: hideInfoTile,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildPageContent extends StatelessWidget {
  final int index;
  final Function() onPressedThirdPartyButton;

  const _BuildPageContent({
    Key? key,
    required this.index,
    required this.onPressedThirdPartyButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return _BuildFirstPageContent(
        onPressedThirdPartyButton: onPressedThirdPartyButton,
      );
    } else if (index == 1) {
      return const _BuildSecondPageContent();
    } else {
      return const CircularProgressIndicator();
    }
  }
}

class _BuildFirstPageContent extends StatelessWidget {
  final Function() onPressedThirdPartyButton;

  const _BuildFirstPageContent({
    Key? key,
    required this.onPressedThirdPartyButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeOutExpo,
      duration: 350.milliseconds,
      opacity: context.watch<RegisterViewCubit>().firstPageOpacity,
      child: Column(
        key: const Key('First'),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.058.sw),
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome to \nStorayge!',
              style: appTextTheme(context).headline2!.copyWith(fontSize: 36.sp),
              textAlign: TextAlign.left,
            ),
          ),
          customVerticalSpace(height: 0.08.sh),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.073.sw),
            child: const RegisterFormFirstPage(),
          ),
          Container(
            constraints: BoxConstraints.loose(Size(double.infinity, 0.25.sh)),
            child: Column(
              children: [
                verticalSpace24,
                Text('or', style: appTextTheme(context).headline3),
                verticalSpace24,
                ThirdPartySignUpButton(
                  content: 'Sign up with Google',
                  onPressed: onPressedThirdPartyButton,
                  width: 0.5.sw,
                ),
                verticalSpace24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: appTextTheme(context).caption,
                    ),
                    customHorizontalSpace(width: 5),
                    PressableText(
                      content: 'Login here',
                      onTap: () {
                        print('Login here pressed');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildSecondPageContent extends StatelessWidget {
  const _BuildSecondPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeOutExpo,
      duration: 350.milliseconds,
      opacity: context.watch<RegisterViewCubit>().secondPageOpacity,
      child: Column(
        key: const Key('second'),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.058.sw),
            alignment: Alignment.centerLeft,
            child: Text(
              "Make sure \nit's secure!",
              style: appTextTheme(context).headline2!.copyWith(fontSize: 36.sp),
              textAlign: TextAlign.left,
            ),
          ),
          customVerticalSpace(height: 0.08.sh),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.073.sw),
            child: const RegisterFormSecondPage(),
          ),
          Container(
            constraints: BoxConstraints.loose(Size(double.infinity, 0.25.sh)),
          )
        ],
      ),
    );
  }
}

class _BuildBottomButtons extends StatelessWidget {
  final Function() showInfoTile;
  final Function() hideInfoTile;

  const _BuildBottomButtons({
    Key? key,
    required this.showInfoTile,
    required this.hideInfoTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFirstPage;
    final currentPageIndex =
        context.watch<RegisterViewCubit>().currentPageIndex;
    if (currentPageIndex == 0) {
      isFirstPage = true;
    } else {
      isFirstPage = false;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.41.sw,
            child: AnimatedSwitcher(
              duration: 250.milliseconds,
              switchInCurve: Curves.easeOutExpo,
              switchOutCurve: Curves.easeOutExpo,
              transitionBuilder: (child, animation) {
                final inAnimation = Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation);

                return SlideTransition(
                  position: inAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: isFirstPage
                  ? createWhiteSpace()
                  : createSecondaryButton(context),
            ),
          ),
          PrimaryButtonAware(
            type: PrimaryButtonAwareType.twoPage,
            firstPageContent: 'Next',
            firstPageButtonIcon: const Icon(
              StoraygeIcons.storayge_arrow_right,
              color: Colors.black,
              size: 8,
            ),
            firstPageOnPressed: () {
              checkIfUsernameAndEmailIsValid(context);
            },
            secondPageContent: 'Confirm',
            secondPageButtonIcon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
            secondPageOnPressed: () {
              checkIfPasswordIsEqualAndRegister(context);
            },
            width: 0.41.sw,
          ),
        ],
      ),
    );
  }

  /// Brief explanation of what this method is doing.
  ///
  /// First of all it will add the [unfocusAllNodes] event to the form bloc
  /// to unfocus.
  ///
  /// Then it directly request a validation of the form using the formkey. As of
  /// now there are no plans to make that into an event because I don't know how
  /// to indicate the validation event has been completed.
  ///
  /// After validating, [firstFieldValue] is retrieved and the [authCubit] is ran
  /// with the [isEmailNotRegistered] method.
  ///
  /// If successfull, [triggerSecondPage] will be called for [PrimaryButtonAwareCubit],
  /// [TwoPaginationProgressCubit] and [RegisterViewCubit].
  ///
  /// TODO: Error Handling Docs
  Future<void> checkIfUsernameAndEmailIsValid(BuildContext context) async {
    readFirstFormBloc(context).add(unfocusAllNodes);
    readFirstFormBloc(context).add(enableAlwaysValidation);
    final bool isFormValid =
        readFirstFormBloc(context).state.props.formKey.currentState!.validate();

    if (isFormValid == true) {
      final String? currentEmail =
          readFirstFormBloc(context).state.props.secondFieldValue;
      context.read<PrimaryButtonAwareCubit>().triggerLoading();
      context.read<InfoTileBloc>().add(InfoTileEvent.triggerStateChange(
          context.read<InfoTileBloc>().state.infoTileProps.copyWith(
                leadingText: 'Give us a moment...',
                isAbleToExpand: true,
                currentStatus: InfoTileStatus.loading,
                child: const Text(
                    "We're currently checking if your email can be used, it may take longer if your internet connection is weak."),
              )));

      showInfoTile();
      await context
          .read<AuthCubit>()
          .isEmailNotRegisteredRun(email: currentEmail!)
          .then((_) {
        final AuthState currentAuthState = context.read<AuthCubit>().state;
        if (currentAuthState is AuthGeneralCompleted) {
          context.read<PrimaryButtonAwareCubit>().triggerSecondPage();
          context.read<TwoPaginationProgressCubit>().triggerSecondPage();
          readRegisterViewCubit(context).triggerSecondPage();
          context
              .read<InfoTileBloc>()
              .add(const InfoTileEvent.triggerStateChange(InfoTileProps(
                leadingText: 'Great! Your email can be used.',
                child: SizedBox.shrink(),
                isAbleToExpand: false,
                isExpanded: false,
                currentStatus: InfoTileStatus.success,
              )));
        } else if (currentAuthState is AuthError) {
          context.read<PrimaryButtonAwareCubit>().triggerFirstPage();
          context.read<InfoTileBloc>().add(InfoTileEvent.triggerStateChange(
              context.read<InfoTileBloc>().state.infoTileProps.copyWith(
                    leadingText: currentAuthState.message,
                    isAbleToExpand: false,
                    isExpanded: false,
                    currentStatus: InfoTileStatus.error,
                    child: const SizedBox.shrink(),
                  )));
        }
      });
    } else {
      return;
    }
  }

  Future<void> checkIfPasswordIsEqualAndRegister(BuildContext context) async {
    readSecondFormBloc(context).add(unfocusAllNodes);
    readSecondFormBloc(context).add(enableAlwaysValidation);
    final bool isFormValid = readSecondFormBloc(context)
        .state
        .props
        .formKey
        .currentState!
        .validate();
    if (isFormValid == true) {
      final String _currentUsername =
          context.read<FirstTwoFieldsFormBloc>().state.props.firstFieldValue!;
      final String _currentEmail =
          context.read<FirstTwoFieldsFormBloc>().state.props.secondFieldValue!;
      final String _currentPassword =
          context.read<SecondTwoFieldsFormBloc>().state.props.firstFieldValue!;
      final String _currentConfirmPassword =
          context.read<SecondTwoFieldsFormBloc>().state.props.secondFieldValue!;

      context.read<InfoTileBloc>().add(InfoTileEvent.triggerStateChange(
          context.read<InfoTileBloc>().state.infoTileProps.copyWith(
                leadingText: 'Give us a moment...',
                isAbleToExpand: true,
                currentStatus: InfoTileStatus.loading,
                child: const Text("We're creating your account."),
              )));

      showInfoTile();
      context.read<PrimaryButtonAwareCubit>().triggerLoading();

      await context
          .read<AuthCubit>()
          .registerWithEmailAndPasswordRun(
            username: _currentUsername,
            email: _currentEmail,
            password: _currentPassword,
            confirmPassword: _currentConfirmPassword,
          )
          .then(
        (_) {
          final AuthState _currentAuthState = context.read<AuthCubit>().state;
          if (_currentAuthState is AuthLoaded) {
            print('User succesfully registered and logged in with the uid: ');

            context
                .read<InfoTileBloc>()
                .add(const InfoTileEvent.triggerStateChange(InfoTileProps(
                  leadingText: 'Great! Your account has been created.',
                  child: SizedBox.shrink(),
                  isAbleToExpand: false,
                  isExpanded: false,
                  currentStatus: InfoTileStatus.success,
                )));

            context.read<PrimaryButtonAwareCubit>().triggerSecondPage();
          } else if (_currentAuthState is AuthError) {
            context.read<InfoTileBloc>().add(
                  InfoTileEvent.triggerStateChange(
                    context.read<InfoTileBloc>().state.infoTileProps.copyWith(
                          leadingText: 'Gosh, an error occured.',
                          isAbleToExpand: true,
                          currentStatus: InfoTileStatus.error,
                          child: Text(_currentAuthState.message),
                        ),
                  ),
                );
          }
        },
      );
    } else {
      return;
    }
  }

  SecondaryButton createSecondaryButton(BuildContext context) {
    return SecondaryButton(
      content: 'Back',
      onPressed: () {
        readFirstFormBloc(context).add(unfocusAllNodes);
        readSecondFormBloc(context).add(unfocusAllNodes);
        context.read<TwoPaginationProgressCubit>().triggerFirstPage();
        context.read<PrimaryButtonAwareCubit>().triggerFirstPage();
        context.read<RegisterViewCubit>().triggerFirstPage();
        hideInfoTile();
      },
      width: 0.41.sw,
    );
  }

  SizedBox createWhiteSpace() {
    return SizedBox(
      width: 0.41.sw,
      height: 20,
    );
  }
}

class RegisterFormFirstPage extends StatefulWidget {
  const RegisterFormFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormFirstPageState createState() => _RegisterFormFirstPageState();
}

class _RegisterFormFirstPageState extends State<RegisterFormFirstPage> {
  @override
  Widget build(BuildContext context) {
    return TwoFieldsForm<FirstTwoFieldsFormBloc>(
      firstFieldLabel: 'Username',
      firstFieldHintText: 'Please enter your desired username',
      secondFieldLabel: 'Email',
      secondFieldHintText: 'Please enter your email',
      validateFirstField: validateUsername,
      validateSecondField: validateEmail,
    );
  }

  String? validateEmail(String? value) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else {
      if (RegExp(emailRegex).hasMatch(value)) {
        return null;
      } else {
        return 'Please enter a valid email';
      }
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    } else if (value.length <= 3) {
      return 'Usernames must be longer than 3 characters';
    }
    return null;
  }
}

class RegisterFormSecondPage extends StatefulWidget {
  const RegisterFormSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormSecondPageState createState() => _RegisterFormSecondPageState();
}

class _RegisterFormSecondPageState extends State<RegisterFormSecondPage> {
  @override
  Widget build(BuildContext context) {
    return TwoFieldsForm<SecondTwoFieldsFormBloc>(
      firstFieldLabel: 'Password',
      firstFieldHintText: 'Enter your secure password',
      isFirstFieldObscured: true,
      secondFieldLabel: 'Confirm password',
      secondFieldHintText: "Make sure it's the same as above",
      isSecondFieldObscured: true,
      validateFirstField: validatePassword,
      validateSecondField: validateConfirmPassword,
    );
  }

  RegisterViewCubit readRegisterViewCubit(BuildContext context) =>
      context.read<RegisterViewCubit>();

  Align textFieldLabelText(String labelText) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: appTextTheme(context).headline3,
      ),
    );
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return 'Sorry but this cannot be empty';
    } else if (input.length <= 5) {
      return 'Password length must be 6 characters or more';
    }
  }

  String? validateConfirmPassword(String? input) {
    if (input == null || input.isEmpty) {
      return 'Sorry but this cannot be empty';
    } else if ((input != null && !input.isEmpty) &&
        input != readSecondFormBloc(context).state.props.firstFieldValue) {
      return 'Your passwords do not match';
    } else {
      return null;
    }
  }
}
