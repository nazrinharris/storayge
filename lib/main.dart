import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/views/start/start_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StoraygeApp());
}

class StoraygeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Storayge',
      home: StartView(),
    );
  }
}
