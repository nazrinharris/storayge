import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/core/auth/domain/i_repository/i_auth_repository.dart';
import 'package:storayge/locator.dart';
import '../../../core/auth/auth_cubit/auth_cubit.dart';

class SplashView extends StatelessWidget {
  final IAuthRepository authRepository = locator();

  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().isLoggedInRun();

    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthNotLoggedIn) {
              Navigator.of(context).pushNamed('/start');
            } else if (state is AuthLoggedIn) {
              Navigator.of(context).pushNamed('/home');
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                TextButton(
                  onPressed: () {
                    authRepository.signOut();
                  },
                  child: Text('Logout'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
