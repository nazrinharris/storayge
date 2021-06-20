import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/views/register/register_cubit/register_view_cubit.dart';
import 'package:supercharged/supercharged.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress.dart';
import '../../smart_widgets/two_pagination_progress/two_pagination_progress_cubit.dart';

enum _AniProps { xPosition, opacity }

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //bool isFirstPage = true;

    final PageController pageController = PageController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TwoPaginationProgressCubit(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                )),
        BlocProvider(
            create: (context) =>
                RegisterViewCubit(pageController: pageController))
      ],
      child: Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: kcBackgroundColor,
          appBar: AppBarWithTwoPaginationProgress(
            twoPaginationProgress: buildTwoPaginationProgress(screenWidth),
            backButton: () {
              context.read<TwoPaginationProgressCubit>().triggerFirstPage();
              context.read<RegisterViewCubit>().triggerFirstPage();
            },
            closeButton: () {},
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 1.sh,
              width: 1.sw,
              child: SafeArea(
                child: Builder(
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller:
                              context.read<RegisterViewCubit>().pageController,
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _BuildPageContent(
                              index: index,
                            );
                          },
                        ),
                      ),
                      const _BuildBottomButtons(),
                    ],
                  ),
                ),
              ),
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
      return _BuildFirstPageContent();
    } else if (index == 1) {
      return _BuildSecondPageContent();
    } else {
      return CircularProgressIndicator();
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
            alignment: Alignment.centerLeft,
            child: const Text(
              'Welcome to \nStorayge!',
              style: ktsSecondaryHeading,
              textAlign: TextAlign.left,
            ),
          ),
          customVerticalSpace(height: 0.067.sh),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: const RegisterFormFirstPage(),
          ),
          Container(
            constraints: BoxConstraints.loose(Size(double.infinity, 0.35.sh)),
            child: Column(
              children: [
                verticalSpace24,
                const Text('or', style: ktsHeadingParagraph),
                verticalSpace24,
                ThirdPartySignUpButton(
                  content: 'Sign up with Google',
                  onPressed: () {},
                  width: 0.437.sw,
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
            alignment: Alignment.centerLeft,
            child: const Text(
              "Make sure \nit's secure!",
              style: ktsSecondaryHeading,
              textAlign: TextAlign.left,
            ),
          ),
          customVerticalSpace(height: 0.067.sh),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: const RegisterFormSecondPage(),
          ),
          Container(
            constraints: BoxConstraints.loose(Size(double.infinity, 0.35.sh)),
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
    final currentPageIndex = context.read<RegisterViewCubit>().currentPageIndex;
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
                final int index =
                    context.watch<RegisterViewCubit>().currentPageIndex;
                final inAnimation = Tween<Offset>(
                  begin: Offset(0.0, 1.0),
                  end: Offset(0.0, 0.0),
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
              context.read<AuthCubit>().isEmailNotRegisteredRun();
            },
            secondPageOnPressed: () {},
          ),
        ],
      ),
    );
  }

  SecondaryButton createSecondaryButton(BuildContext context) {
    return SecondaryButton(
      content: 'Back',
      onPressed: () {
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
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed)) return kcPrimaryColor;
              if (states.contains(MaterialState.disabled)) {
                return kcPrimaryColor;
              }
              return kcPrimaryColor;
            }),
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
                  ? _buildLoading()
                  : _buildNormalContent(
                      context.read<RegisterViewCubit>().state),
            ),
          ),
        );
      },
    );
  }

  AnimatedSwitcher _buildNormalContent(RegisterViewState state) {
    bool isFirstPage = true;

    if (state is RegisterViewFirstPage) {
      isFirstPage = true;
    } else {
      isFirstPage = false;
    }

    return AnimatedSwitcher(
      duration: 250.milliseconds,
      child: isFirstPage ? _buildFirstPageContent() : _buildSecondPageContent(),
    );
  }

  Row _buildFirstPageContent() {
    return Row(
      key: const Key('build_first_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: ktsButtonText,
        ),
        horizontalSpace14,
        buttonIcon!,
      ],
    );
  }

  Row _buildSecondPageContent() {
    return Row(
      key: const Key('build_second_page_content'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Confirm',
          style: ktsButtonText,
        ),
        horizontalSpace5,
        const Icon(
          Icons.check,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return Container(
      width: 24,
      height: 24,
      child: const CircularProgressIndicator(
        strokeWidth: 2.7,
        color: kcBlack,
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
  final _globalFormKey = GlobalKey<_RegisterFormFirstPageState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalFormKey,
      child: Column(
        children: [
          textFieldLabelText('Username'),
          TextFormField(
              style: ktsParagraph,
              decoration: kInputDecoration(
                hintText: 'Enter your desired username',
              )),
          verticalSpace34,
          textFieldLabelText('Email'),
          TextFormField(
              keyboardAppearance: Brightness.dark,
              style: ktsParagraph,
              decoration: kInputDecoration(
                hintText: 'Enter your email',
              )),
          verticalSpace14,
        ],
      ),
    );
  }

  Align textFieldLabelText(String labelText) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: ktsHeadingParagraph,
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
  final _globalFormKey = GlobalKey<_RegisterFormSecondPageState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalFormKey,
      child: Column(
        children: [
          textFieldLabelText('Password'),
          TextFormField(
              obscureText: true,
              style: ktsParagraph,
              decoration: kInputDecoration(
                hintText: 'Enter your desired username',
              )),
          verticalSpace34,
          textFieldLabelText('Confirm Password'),
          TextFormField(
              obscureText: true,
              keyboardAppearance: Brightness.dark,
              style: ktsParagraph,
              decoration: kInputDecoration(
                hintText: 'Enter your email',
              )),
          verticalSpace14,
        ],
      ),
    );
  }

  Align textFieldLabelText(String labelText) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: ktsHeadingParagraph,
      ),
    );
  }
}
