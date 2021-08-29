import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';

class NavigateView extends StatelessWidget {
  const NavigateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              width: 200,
              child: Text(
                'To Login',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
              width: 200,
              child: Text(
                'To Register',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/main');
              },
              width: 200,
              child: Text(
                'To Main',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/start');
              },
              width: 200,
              child: Text(
                'To Start',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/test');
              },
              width: 200,
              child: Text(
                'To Test',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
            PrimaryButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).execSignOut();
              },
              width: 200,
              child: Text(
                'Signout',
                style: appTextTheme(context).headline6,
              ),
            ),
            verticalSpace14,
          ],
        ),
      ),
    );
  }
}
