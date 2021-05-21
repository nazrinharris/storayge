import 'package:flutter/material.dart';

import 'styles.dart';

AppBar defaultAppBar(
        {required bool hasBackButton, required BuildContext context}) =>
    AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kcBackgroundColor,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
