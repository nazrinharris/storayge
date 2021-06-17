import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auth/auth_cubit/auth_cubit.dart';
import '../../shared/styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().isLoggedInRun();

    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthNotLoggedIn) {
              Navigator.of(context).pushNamed('/start');
            } else if (state is AuthLoggedIn) {
              Navigator.of(context).pushNamed('/home');
            }
          },
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
