import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/presentation/shared/local_buttons.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    StoraygeGroup? doc;

    bool isNull;

    if (doc == null) {
      isNull = true;
    } else {
      isNull = false;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              onPressed: () async {
                doc = await firebaseFirestore
                    .collection(FS_USER_COLLECTION)
                    .doc('ASasErON7MPYCFFUcDblDf9kmcy1')
                    .get()
                    .then((value) => value.data())
                    .then((json) =>
                        StoraygeGroup.fromJson(json!['singleStoraygeGroup']!))
                    .then((doc) {
                  setState(() {});
                  return doc;
                });

                print(doc);

                await firebaseFirestore
                    .collection(FS_USER_COLLECTION)
                    .doc('ASasErON7MPYCFFUcDblDf9kmcy1')
                    .get()
                    .then((doc) => doc.data())
                    .then((json) => json!['singleStoraygeGroup'])
                    .then((json) => print('nz'));
              },
              child: const Text('Test operation'),
            ),
            verticalSpace24,
            TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Hehu'),
            ),
            verticalSpace24,
            Text(
              "$doc",
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
