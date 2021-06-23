import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TwoValueListenableBuilder<A, B> extends StatelessWidget {
  const TwoValueListenableBuilder({
    Key? key,
    required this.firstListenable,
    required this.secondListenable,
    required this.child,
    required this.builder,
  }) : super(key: key);

  final ValueListenable<A> firstListenable;
  final ValueListenable<B> secondListenable;
  final Widget child;
  final Widget Function(BuildContext context, A a, B b, Widget child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: firstListenable,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: secondListenable,
          builder: (_, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
