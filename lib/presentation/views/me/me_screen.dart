import 'dart:async';

import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  Size _widgetSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    void _handleOnSized(Size value) => setState(() => _widgetSize = value);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'me',
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
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MeasurableWidget(
                onSized: _handleOnSized,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'This text is meant to be long, meaning it should be done as such. Widget size is : $_widgetSize',
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      width: 51,
                      height: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MeasurableWidget extends StatefulWidget {
  const MeasurableWidget({
    Key? key,
    required this.child,
    required this.onSized,
  }) : super(key: key);
  final Widget child;
  final Function(Size size) onSized;
  @override
  _MeasurableWidgetState createState() => _MeasurableWidgetState();
}

class _MeasurableWidgetState extends State<MeasurableWidget> {
  bool _hasMeasured = false;
  @override
  Widget build(BuildContext context) {
    final Size size = context.size ?? Size.zero;

    if (size != Size.zero) {
      widget.onSized.call(size);
    } else if (!_hasMeasured) {
      // Need to build twice in order to get size
      scheduleMicrotask(() => setState(() => _hasMeasured = true));
    }
    return widget.child;
  }
}
