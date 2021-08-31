import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/views/find/find_view.dart';
import 'package:storayge/presentation/views/home/home_view.dart';
import 'package:storayge/presentation/views/list/list_screen.dart';
import 'package:storayge/presentation/views/me/me_screen.dart';
import 'package:supercharged/supercharged.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BottomNavLayout(
              lazyLoadPages: true,
              savePageState: false,
              pageTransitionData: _pageTransition(),
              pages: [
                (_) => const HomeView(),
                (_) => const ListScreen(),
                (_) => const FindView(),
                (_) => const MeScreen(),
              ],
              bottomNavigationBar: (currentIndex, onTap) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).bottomAppBarColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: GNav(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    tabBackgroundColor: Theme.of(context).cardColor,
                    rippleColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    hoverColor:
                        Theme.of(context).primaryColor.withOpacity(0.35),
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.45),
                    activeColor: Theme.of(context).iconTheme.color,
                    duration: 350.milliseconds,
                    gap: 8,
                    tabs: [
                      GButton(
                        padding: tabPadding(),
                        icon: StoraygeIcons.storayge_home,
                        iconSize: 26,
                        text: 'Home',
                        textStyle: appTextTheme(context).headline3,
                      ),
                      GButton(
                        padding: tabPadding(horizontal: 24),
                        iconSize: 22,
                        icon: StoraygeIcons.storayge_list,
                        text: 'List',
                        textStyle: appTextTheme(context).headline3,
                      ),
                      GButton(
                        padding: tabPadding(),
                        icon: StoraygeIcons.storayge_find,
                        text: 'Find',
                        textStyle: appTextTheme(context).headline3,
                      ),
                      GButton(
                        padding: tabPadding(),
                        icon: StoraygeIcons.storayge_me,
                        text: 'Me',
                        textStyle: appTextTheme(context).headline3,
                      ),
                    ],
                    selectedIndex: currentIndex,
                    onTabChange: onTap,
                  ),
                );
              },
            ),
            // Container(
            //   alignment: Alignment.bottomRight,
            //   padding: EdgeInsets.only(bottom: 80, right: 24),
            //   height: 1.sh,
            //   width: 1.sw,
            //   child: SizedBox(
            //       height: 56,
            //       width: 56,
            //       child: FloatingActionButton(
            //         onPressed: () {},
            //       )),
            // )
          ],
        ));
  }

  EdgeInsets tabPadding({double? vertical, double? horizontal}) =>
      EdgeInsets.symmetric(
          vertical: vertical ?? 10, horizontal: horizontal ?? 16);

  PageTransitionData _pageTransition() {
    return PageTransitionData(
      builder: (controller, child) => AnimatedBuilder(
        animation: Tween(begin: 0.0, end: 1.0).animate(controller),
        builder: (context, child) => Opacity(
          opacity: controller.value,
          child: Transform.scale(
            scale: 1.05 - (controller.value * 0.05),
            child: child,
          ),
        ),
        child: child,
      ),
      duration: 100,
      //direction: AnimationDirection.inAndOut,
    );
  }
}
