import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:storayge/ui/shared/styles.dart';

import '../home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Center(
          child: Column(
            children: [
              Text('Start View'),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: model.navigateToStart, child: Text('Go to start'))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
