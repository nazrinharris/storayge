import 'package:boxy/flex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:boxy/boxy.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:math';

// ignore_for_file: prefer_const_constructors

List<StoraygeGroupSnippet> allListSGSnip = [
  const StoraygeGroupSnippet(
    sgId: 'id_one',
    sgName: 'a particular named widget in which I want it to be long',
    sgDesc:
        'a particular description wherein the description is deliberately long',
    sgImgPath: 'none',
  ),
  const StoraygeGroupSnippet(
    sgId: 'id_one',
    sgName: "a particular named widget in which it'd be pretty long",
    sgDesc:
        'a particular description wherein the description is deliberately long. But is in fact longer than others',
    sgImgPath: 'none',
  )
];

class FindView extends StatefulWidget {
  const FindView({Key? key}) : super(key: key);

  @override
  _FindViewState createState() => _FindViewState();
}

class _FindViewState extends State<FindView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            FindViewHeadingSliver(),
            ListCardSliverBuilder(),
          ],
        ),
      ),
    );
  }
}

class ListCardSliverBuilder extends StatelessWidget {
  const ListCardSliverBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: ExpandableListCard(),
          ),
        ],
      ),
    );
  }
}

class ExpandableListCard extends StatefulWidget {
  const ExpandableListCard({Key? key}) : super(key: key);

  @override
  _ExpandableListCardState createState() => _ExpandableListCardState();
}

class _ExpandableListCardState extends State<ExpandableListCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Theme.of(context).canvasColor,
        child: InkWell(
          onTap: () {},
          splashColor: Theme.of(context).primaryColor.withOpacity(0.20),
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoxyRow(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dominant.expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 18, top: 24, bottom: 24, right: 20),
                      child: Text(
                        allListSGSnip[0].sgName,
                        style: appTextTheme(context)
                            .headline2!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 56,
                    child: Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 6, right: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: kcSecondaryLighterShadeColor,
                          child: Ink(
                              child: InkWell(
                            splashColor: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.20),
                            highlightColor: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.15),
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Padding(
                                  padding: EdgeInsets.all(6),
                                  child: AnimatedContainer(
                                    duration: 350.milliseconds,
                                    curve: Curves.fastOutSlowIn,
                                    height:
                                        isExpanded ? 41 : constraints.maxHeight,
                                    transform: Matrix4.identity()
                                      ..rotateZ(isExpanded ? -pi : 0),
                                    transformAlignment: Alignment.center,
                                    child: const Icon(Icons.expand_more),
                                  ),
                                );
                              },
                            ),
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AnimatedCrossFade(
                duration: 350.milliseconds,
                firstCurve: Curves.fastOutSlowIn,
                secondCurve: Curves.fastOutSlowIn,
                sizeCurve: Curves.fastOutSlowIn,
                firstChild: Padding(
                  padding: EdgeInsets.only(
                    bottom: 24,
                    left: 24,
                  ),
                  child: Text(
                    allListSGSnip[0].sgDesc,
                    style: appTextTheme(context).bodyText1,
                  ),
                ),
                secondChild: const SizedBox.shrink(),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FindViewHeadingSliver extends StatelessWidget {
  const FindViewHeadingSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'find',
                  style: appTextTheme(context)
                      .headline1!
                      .copyWith(fontSize: 48.sp),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.help_outline))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CollapseWidget extends StatefulWidget {
//   @override
//   _CollapseWidgetState createState() => _CollapseWidgetState();
// }

// class _CollapseWidgetState extends State<CollapseWidget>
//     with TickerProviderStateMixin {
//   GlobalKey? _keyFoldChild;
//   bool collapsed = false;
//   double? _childWidth;
//   AnimationController? _controller;
//   Animation<double>? _sizeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _keyFoldChild = GlobalKey();
//     WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
//   }

//   void _afterLayout(_) {
//     final BuildContext renderBox = _keyFoldChild!.currentContext!;
//     _sizeAnimation = Tween<double>(begin: renderBox.size!.height, end: 0.0)
//         .animate(_controller!);
//     _childWidth = renderBox.size!.width;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         RaisedButton(
//           onPressed: () {
//             setState(() {
//               collapsed = !collapsed;
//             });
//             if (collapsed) {
//               _controller!.forward();
//             } else {
//               _controller!.reverse();
//             }
//           },
//           child: Text("Click me"),
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             AnimatedContainer(
//               duration: Duration(seconds: 1),
//               height: collapsed ? 0 : 100,
//               color: Colors.orange,
//               child: Text("Just some text"),
//             ),
//             AnimatedBuilder(
//               animation: _controller!,
//               builder: (context, child) {
//                 if (_sizeAnimation == null) {
//                   return child!;
//                 } else {
//                   return ClipRect(
//                     child: SizedOverflowBox(
//                       size: Size(_childWidth!, _sizeAnimation!.value),
//                       child: child,
//                     ),
//                   );
//                 }
//               },
//               child: Container(
//                 key: _keyFoldChild,
//                 color: Colors.red,
//                 child: Text("Lorem Ipsum Dolar Sit"),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
