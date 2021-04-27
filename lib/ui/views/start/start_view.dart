import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:storayge/ui/shared/styles.dart';
import 'package:storayge/ui/shared/ui_helpers.dart';
import 'package:storayge/ui/views/start/start_viewmodel.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        body: SafeArea(
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Storayge', style: ktsPrimaryHeading),
                    horizontalSpaceMedium,
                  ],
                )
              ],
            )
          ],
        )),
      ),
      viewModelBuilder: () => StartViewModel(),
    );
  }
}
