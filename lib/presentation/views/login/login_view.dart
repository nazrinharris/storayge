import 'package:flutter/material.dart';

import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(hasBackButton: true, context: context),
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
          child: Center(
        child: Text('Bruh login'),
      )),
    );
  }
}
