import 'package:flutter/material.dart';

import '../../../presentation/shared/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          children: [
            const Text('Start View'),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: const Text('Go to start'))
          ],
        ),
      ),
    );
  }
}
