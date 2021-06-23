import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/helper_widgets/two_value_listenable_builder.dart';
import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/views/register/register_cubit/register_view_cubit.dart';
import 'package:supercharged/supercharged.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final FocusNode userNameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final FocusNode confirmPasswordFocusNode = FocusNode();
    final PageController pageController = PageController();

    final GlobalKey<FormState> firstPageFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> secondPageFormKey = GlobalKey<FormState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TwoPaginationProgressCubit(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                )),
        BlocProvider(
            create: (context) => RegisterViewCubit(
                  authCubit: context.read<AuthCubit>(),
                  pageController: pageController,
                  usernameFocusNode: userNameFocusNode,
                  emailFocusNode: emailFocusNode,
                  passwordFocusNode: passwordFocusNode,
                  confirmPasswordFocusNode: confirmPasswordFocusNode,
                  firstPageFormKey: firstPageFormKey,
                  secondPageFormKey: secondPageFormKey,
                ))
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
              return false;
            }
          },
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBarWithTwoPaginationProgress(
              twoPaginationProgress: buildTwoPaginationProgress(screenWidth),
              backButton: () {
                context.read<RegisterViewCubit>().triggerAllNodesUnfocus();
                context.read<TwoPaginationProgressCubit>().triggerFirstPage();
                context.read<RegisterViewCubit>().triggerFirstPage();
              },
              closeButton: () {
                context.read<RegisterViewCubit>().triggerAllNodesUnfocus();
              },
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 1.sh,
                    width: 1.sw,
                    child: SafeArea(
                      left: false,
                      right: false,
                      child: Builder(
                        builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0.058.sw),
                                child: const _BuildBottomButtons()),
                          ],
                        ),
                      ),
                    ),
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

  const _BuildPageContent({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const _BuildFirstPageContent();
    } else if (index == 1) {
      return const _BuildSecondPageContent();
    } else {
      return const CircularProgressIndicator();
    }
  }
}

class _BuildFirstPageContent extends StatelessWidget {
  const _BuildFirstPageContent({Key? key}) : super(key: key);

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
                  onPressed: () {},
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
                          print('hye');
                        })
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
  const _BuildBottomButtons({
    Key? key,
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
            customContent: 'Next',
            customButtonIcon: const Icon(
              StoraygeIcons.storayge_arrow_right,
              color: Colors.black,
              size: 8,
            ),
            customWidth: 0.41.sw,
            firstPageOnPressed: () {
              context.read<RegisterViewCubit>().triggerAllNodesUnfocus();
              readRegisterViewCubit(context).validateUsernameField();
              readRegisterViewCubit(context).validateEmailField();
              checkIfUsernameAndEmailIsValid(context);
            },
            secondPageOnPressed: () {},
          ),
        ],
      ),
    );
  }

  void checkIfUsernameAndEmailIsValid(BuildContext context) {
    if (context.read<RegisterViewCubit>().validateFirstForm() == false) {
    } else {
      context.read<AuthCubit>().isEmailNotRegisteredRun();
    }
  }

  SecondaryButton createSecondaryButton(BuildContext context) {
    return SecondaryButton(
      content: 'Back',
      onPressed: () {
        context.read<RegisterViewCubit>().triggerAllNodesUnfocus();
        context.read<TwoPaginationProgressCubit>().triggerFirstPage();
        context.read<RegisterViewCubit>().triggerFirstPage();
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

class PrimaryButtonAware extends StatelessWidget implements PrimaryButton {
  final Icon customButtonIcon;
  final String customContent;
  final Function() firstPageOnPressed;
  final Function() secondPageOnPressed;
  final double customWidth;

  const PrimaryButtonAware({
    Key? key,
    required this.customButtonIcon,
    required this.customContent,
    required this.firstPageOnPressed,
    required this.customWidth,
    required this.secondPageOnPressed,
  }) : super(key: key);

  @override
  Icon? get buttonIcon => customButtonIcon;

  @override
  String get content => customContent;

  @override
  Function() get onPressed => firstPageOnPressed;

  @override
  double? get width => customWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        Function()? activeOnPressed = onPressed;
        bool isLoading = false;

        if (state is AuthIdle) {
          if (context.read<RegisterViewCubit>().state
              is RegisterViewSecondPage) {
            activeOnPressed = secondPageOnPressed;
          } else {
            activeOnPressed = firstPageOnPressed;
          }
          isLoading = false;
        } else if (state is AuthLoading) {
          activeOnPressed = null;
          isLoading = true;
        } else if (state is AuthGeneralCompleted) {
          activeOnPressed = () {};
          isLoading = false;
          context.read<TwoPaginationProgressCubit>().triggerSecondPage();
          context.read<RegisterViewCubit>().triggerSecondPage();
          context.read<AuthCubit>().emitIdle();
        } else {
          activeOnPressed = onPressed;
          isLoading = false;
        }

        return ElevatedButton(
          onPressed: activeOnPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          child: SizedBox(
            width: width,
            height: 46,
            child: AnimatedSwitcher(
              duration: 500.milliseconds,
              child: isLoading
                  ? _buildLoading(context)
                  : _buildNormalButtonContent(
                      context.watch<RegisterViewCubit>().state, context),
            ),
          ),
        );
      },
    );
  }

  AnimatedSwitcher _buildNormalButtonContent(
      RegisterViewState state, BuildContext context) {
    bool isFirstPage = true;

    if (state is RegisterViewFirstPage) {
      isFirstPage = true;
    } else {
      isFirstPage = false;
    }

    return AnimatedSwitcher(
      duration: 250.milliseconds,
      child: isFirstPage
          ? _buildFirstPageButtonContent(context)
          : _buildSecondPageButtonContent(context),
    );
  }

  Row _buildFirstPageButtonContent(BuildContext context) {
    return Row(
      key: const Key('build_first_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        horizontalSpace14,
        buttonIcon!,
      ],
    );
  }

  Row _buildSecondPageButtonContent(BuildContext context) {
    return Row(
      key: const Key('build_second_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Confirm',
          style: appTextTheme(context).bodyText1!.copyWith(color: Colors.black),
        ),
        horizontalSpace5,
        const Icon(
          Icons.check,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.7,
        color: Theme.of(context).indicatorColor,
      ),
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
    return TwoValueListenableBuilder(
      firstListenable:
          readRegisterViewCubit(context).isFirstInteractionWithUsernameField,
      secondListenable:
          readRegisterViewCubit(context).isFirstInteractionWithEmailField,
      builder: (context, first, second, child) {
        return Form(
          key: readRegisterViewCubit(context).firstPageFormKey,
          child: Column(
            children: [
              TextFieldLabelText('Username'),
              TextFormField(
                  focusNode:
                      context.read<RegisterViewCubit>().usernameFocusNode,
                  onChanged: (value) {
                    // Should update the cubit's local username value.
                    readRegisterViewCubit(context)
                        .triggerUsernameAndOrEmailValueChanged(
                            newUsernameValue: value);
                  },
                  onFieldSubmitted: (value) {
                    // Should validate the current value and proceed to focus on the next field.
                    readRegisterViewCubit(context).focusOnEmailTextField();
                    readRegisterViewCubit(context).validateUsernameField();
                  },
                  textInputAction: TextInputAction.next,
                  validator: validateUsername,
                  // Should read this TextField's validation mode from cubit.
                  autovalidateMode: readRegisterViewCubit(context)
                      .autovalidateModeUsernameField,
                  // Should read the cubit's local username value
                  initialValue: readRegisterViewCubit(context).usernameValue,
                  style: appTextTheme(context).bodyText1,
                  decoration: kInputDecoration(
                    context: context,
                    hintText: 'Enter your desired username',
                  )),
              verticalSpace34,
              TextFieldLabelText('Email'),
              TextFormField(
                  // controller: readRegisterViewCubit(context).emailFieldController,
                  focusNode: context.read<RegisterViewCubit>().emailFocusNode,
                  onChanged: (value) {
                    readRegisterViewCubit(context)
                        .triggerUsernameAndOrEmailValueChanged(
                            newEmailValue: value);
                  },
                  onFieldSubmitted: (value) {
                    readRegisterViewCubit(context).validateEmailField();
                    setState(() {
                      readRegisterViewCubit(context).validateEmailField();
                    });
                  },
                  validator: validateEmail,
                  autovalidateMode: watchRegisterViewCubit(context)
                      .autovalidateModeEmailField,
                  initialValue: readRegisterViewCubit(context).emailValue,
                  style: appTextTheme(context).bodyText1,
                  decoration: kInputDecoration(
                    context: context,
                    hintText: 'Enter your email',
                  )),
              verticalSpace14,
            ],
          ),
        );
      },
      child: const SizedBox(),
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

class TextFieldLabelText extends StatelessWidget {
  final String labelText;
  const TextFieldLabelText(this.labelText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: appTextTheme(context).headline3,
      ),
    );
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
    return Form(
      key: readRegisterViewCubit(context).secondPageFormKey,
      child: Column(
        children: [
          textFieldLabelText('Password'),
          TextFormField(
              focusNode: context.read<RegisterViewCubit>().passwordFocusNode,
              onChanged: (value) {
                readRegisterViewCubit(context)
                    .triggerPasswordAndOrConfirmPasswordValueChanged(
                        newPasswordValue: value);
              },
              initialValue: readRegisterViewCubit(context).passwordValue,
              obscureText: true,
              style: appTextTheme(context).bodyText1,
              decoration: kInputDecoration(
                context: context,
                hintText: 'Enter your desired username',
              )),
          verticalSpace34,
          textFieldLabelText('Confirm Password'),
          TextFormField(
              focusNode:
                  context.read<RegisterViewCubit>().confirmPasswordFocusNode,
              onChanged: (value) {
                readRegisterViewCubit(context)
                    .triggerPasswordAndOrConfirmPasswordValueChanged(
                        newConfirmPasswordValue: value);
              },
              initialValue: readRegisterViewCubit(context).confirmPasswordValue,
              obscureText: true,
              keyboardAppearance: Brightness.dark,
              style: appTextTheme(context).bodyText1,
              decoration: kInputDecoration(
                context: context,
                hintText: 'Enter your email',
              )),
          verticalSpace14,
        ],
      ),
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
}
