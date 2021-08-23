import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'home',
                    style: appTextTheme(context)
                        .headline1!
                        .copyWith(fontSize: 48.sp),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.help_outline))
                ],
              ),
            ),
            Container(
              key: const Key('search-bar'),
              height: 32.0,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
