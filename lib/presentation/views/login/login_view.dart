import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/bloc/info_tile_bloc.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/info_tile.dart';
import 'package:storayge/presentation/smart_widgets/primary_button_aware/primary_button_aware_cubit.dart';
import 'package:storayge/presentation/smart_widgets/two_fields_form.dart/two_fields_form_bloc.dart';
import 'package:storayge/presentation/views/login/bloc/login_view_bloc.dart';

import '../../../locator.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with AnimationMixin {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginViewBloc(
            loginViewProps: const LoginViewProps(
              isInfoTileVisible: false,
            ),
            authCubit: locator(),
          ),
        ),
        BlocProvider(create: (context) => PrimaryButtonAwareCubit()),
        BlocProvider<FirstTwoFieldsFormBloc>(
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
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: DefaultAppBar(
            closeButton: () {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Align(
                              heightFactor: _infoTileHeightFactor.value,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Opacity(
                                  opacity: _infoTileOpacity.value,
                                  child: const InfoTile(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: _BuildPageContent(
                              showInfoTile: showInfoTile,
                              hideInfoTile: hideInfoTile,
                            ),
                          ),
                        ],
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
                    child: _BuildBottomButton(
                      showInfoTile: showInfoTile,
                      hideInfoTile: hideInfoTile,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildBottomButton extends StatelessWidget {
  final Function() showInfoTile;
  final Function() hideInfoTile;

  const _BuildBottomButton({
    Key? key,
    required this.hideInfoTile,
    required this.showInfoTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PrimaryButtonAware(
            firstPageContent: 'Continue',
            firstPageOnPressed: () {
              _firstPageOnPressed(context, showInfoTile, hideInfoTile);
            },
            firstPageButtonIcon: const Icon(
              StoraygeIcons.storayge_arrow_right,
              color: Colors.black,
              size: 8,
            ),
            type: PrimaryButtonAwareType.onePage,
            width: 0.41.sw,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            borderRadius: 20.0,
          ),
        ],
      ),
    );
  }
}

void _firstPageOnPressed(
  BuildContext context,
  Function() showInfoTile,
  Function() hideInfoTile,
) {
  context
      .read<FirstTwoFieldsFormBloc>()
      .add(const TwoFieldsFormEvent.enableAlwaysValidation());

  if (context
      .read<FirstTwoFieldsFormBloc>()
      .state
      .props
      .formKey
      .currentState!
      .validate()) {
    context.read<LoginViewBloc>().add(
          LoginViewEvent.continuePressed(
            email: context
                .read<FirstTwoFieldsFormBloc>()
                .state
                .props
                .firstFieldValue!,
            password: context
                .read<FirstTwoFieldsFormBloc>()
                .state
                .props
                .secondFieldValue!,
            showInfoTile: showInfoTile,
            hideInfoTile: hideInfoTile,
            updateInfoTile: (InfoTileProps infoTileProps) {
              context.read<InfoTileBloc>().add(
                    InfoTileEvent.triggerStateChange(infoTileProps),
                  );
            },
            triggerLoadingPrimaryButtonAware: () {
              context.read<PrimaryButtonAwareCubit>().triggerLoading();
            },
            triggerFirstPrimaryButtonAware: () {
              context.read<PrimaryButtonAwareCubit>().triggerFirstPage();
            },
            doAfterError: () {},
            doAfterSuccess: () {},
          ),
        );
  } else {
    return;
  }
}

class _BuildPageContent extends StatelessWidget {
  final Function() showInfoTile;
  final Function() hideInfoTile;

  const _BuildPageContent({
    Key? key,
    required this.hideInfoTile,
    required this.showInfoTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.058.sw),
          alignment: Alignment.centerLeft,
          child: Text(
            'Delighted to \nhave you back!',
            style: appTextTheme(context).headline2!.copyWith(fontSize: 36.sp),
            textAlign: TextAlign.left,
          ),
        ),
        customVerticalSpace(height: 0.08.sh),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.073.sw),
          child: const LoginForm(),
        ),
        verticalSpace34,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot your password?',
              style: appTextTheme(context).caption,
            ),
            customHorizontalSpace(width: 5),
            PressableText(
              content: 'Click here',
              onTap: () {
                print('Forgot Password Clicked');
                if (context
                    .read<LoginViewBloc>()
                    .state
                    .loginViewProps
                    .isInfoTileVisible) {
                  context
                      .read<LoginViewBloc>()
                      .add(const LoginViewEvent.toggleInfoTileVisibility());
                  hideInfoTile();
                  print('Hiding Tile');
                } else {
                  context
                      .read<LoginViewBloc>()
                      .add(const LoginViewEvent.toggleInfoTileVisibility());
                  showInfoTile();
                  print('Showing Tile');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TwoFieldsForm<FirstTwoFieldsFormBloc>(
      firstFieldLabel: 'Email',
      firstFieldHintText: 'Enter your email',
      secondFieldLabel: 'Password',
      secondFieldHintText: "Enter your password",
      isSecondFieldObscured: true,
      validateFirstField: validateEmail,
      validateSecondField: validatePassword,
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Sorry but this cannot be empty";
    } else {
      return null;
    }
  }
}
