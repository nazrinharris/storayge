import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
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

    bool isFirstPage = true;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TwoPaginationProgressCubit(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                )),
        BlocProvider(create: (context) => RegisterViewCubit())
      ],
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: kcBackgroundColor,
          appBar: appBarWithTwoPaginationProgress(
            context: context,
            twoPaginationProgress: buildTwoPaginationProgress(screenWidth),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 1.sh,
              width: 1.sw,
              child: SafeArea(
                child: BlocBuilder<RegisterViewCubit, RegisterViewState>(
                  builder: (context, state) {
                    Widget? _buildContent;

                    if (state is RegisterViewFirstPage) {
                      _buildContent = _BuildFirstPageContent();
                    } else if (state is RegisterViewSecondPage) {
                      _buildContent = _BuildSecondPageContent();
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedSwitcher(
                          duration: 500.milliseconds,
                          reverseDuration: 500.milliseconds,
                          switchInCurve: Curves.easeOutExpo,
                          switchOutCurve: Curves.easeInExpo,
                          transitionBuilder: (child, animation) {
                            final inAnimation = Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: const Offset(0.0, 0.0))
                                .animate(animation);

                            final outAnimation = Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: const Offset(0.0, 0.0))
                                .animate(animation);

                            if (child is _BuildFirstPageContent) {
                              return SlideTransition(
                                position: inAnimation,
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            } else if (child is _BuildSecondPageContent) {
                              return SlideTransition(
                                position: outAnimation,
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                          child: _buildContent,
                        ),
                        const _BuildSecondPageButtons(),
                      ],
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }
}

class _BuildFirstPageContent extends StatefulWidget {
  const _BuildFirstPageContent({
    Key? key,
  }) : super(key: key);

  @override
  __BuildFirstPageContentState createState() => __BuildFirstPageContentState();
}

class __BuildFirstPageContentState extends State<_BuildFirstPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              const ThirdPartySignUpButton()
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildFirstPageButtons extends StatelessWidget {
  const _BuildFirstPageButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PrimaryButton(
            content: 'Next',
            buttonIcon: const Icon(
              StoraygeIcons.storayge_arrow_right,
              color: Colors.black,
              size: 8,
            ),
            width: 0.41.sw,
            onPressed: () {
              context.read<TwoPaginationProgressCubit>().triggerSecondPage();
              context.read<RegisterViewCubit>().triggerSecondPage();
            },
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
    return Column(
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
    );
  }
}

class _BuildSecondPageButtons extends StatelessWidget {
  const _BuildSecondPageButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryButton(
            content: 'Back',
            onPressed: () {
              context.read<TwoPaginationProgressCubit>().triggerFirstPage();
              context.read<RegisterViewCubit>().triggerFirstPage();
            },
            width: 0.41.sw,
          ),
          PrimaryButton(
            content: 'Next',
            buttonIcon: const Icon(
              StoraygeIcons.storayge_arrow_right,
              color: Colors.black,
              size: 8,
            ),
            width: 0.41.sw,
            onPressed: () {
              context.read<TwoPaginationProgressCubit>().triggerSecondPage();
              context.read<RegisterViewCubit>().triggerSecondPage();
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: Column(
            children: [
              verticalSpace24,
              const Text('or', style: ktsHeadingParagraph),
              verticalSpace24,
              ThirdPartySignUpButton()
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SecondaryButton(
              content: 'Back',
              onPressed: () {
                context.read<TwoPaginationProgressCubit>().triggerFirstPage();
                context.read<RegisterViewCubit>().triggerFirstPage();
              },
              width: 0.41.sw,
            ),
            PrimaryButton(
              content: 'Next',
              buttonIcon: const Icon(
                StoraygeIcons.storayge_arrow_right,
                color: Colors.black,
                size: 8,
              ),
              width: 0.41.sw,
              onPressed: () {
                context.read<TwoPaginationProgressCubit>().triggerSecondPage();
                context.read<RegisterViewCubit>().triggerSecondPage();
              },
            ),
          ],
        ),
        verticalSpace34
      ],
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
