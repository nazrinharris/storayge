import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'package:storayge/locator.dart';

import '../../../presentation/shared/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state is AuthIdle)
                  InitialStateWidget(
                    getStoraygeUser: () {
                      dispatchUser(context);
                    },
                  ),
                if (state is AuthLoading) const CircularProgressIndicator(),
                if (state is AuthGetStoraygeUserCompleted)
                  LoadedWidget(
                    storaygeUser: state.storaygeUser,
                    getStoraygeUser: () {
                      dispatchUser(context);
                    },
                  ),
                if (state is AuthError)
                  ErrorMessage(
                    message: state.message,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void dispatchUser(BuildContext context) {
    context.read<AuthCubit>().getStoraygeUserData(uid: 'test_uid');
  }
}

class InitialStateWidget extends StatelessWidget {
  final Function()? getStoraygeUser;

  const InitialStateWidget({
    this.getStoraygeUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Once you press this button, we will retrieve StoraygeUser'),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: getStoraygeUser,
            child: const Text('Attempt to retrieve user'))
      ],
    );
  }
}

class LoadedWidget extends StatelessWidget {
  final StoraygeUser storaygeUser;
  final Function()? getStoraygeUser;

  const LoadedWidget({
    Key? key,
    this.getStoraygeUser,
    required this.storaygeUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('User succesfully retrieved'),
        const SizedBox(height: 20),
        Text('Username : ${storaygeUser.username}'),
        const SizedBox(height: 10),
        Text('Email : ${storaygeUser.email}'),
        const SizedBox(height: 10),
        Text('UID : ${storaygeUser.uid}'),
        const SizedBox(height: 20),
        TextButton(
            onPressed: getStoraygeUser,
            child: const Text('Attempt to retrieve user'))
      ],
    );
  }
}

class UnknownError extends StatelessWidget {
  const UnknownError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Unexpected. You should not even be here.');
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Icon(Icons.error),
        const SizedBox(height: 20),
        Text(message),
      ],
    );
  }
}
