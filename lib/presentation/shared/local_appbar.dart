import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/presentation/smart_widgets/two_pagination_progress/two_pagination_progress.dart';
import 'package:storayge/presentation/smart_widgets/two_pagination_progress/two_pagination_progress_cubit.dart';
import 'package:storayge/presentation/views/register/register_cubit/register_view_cubit.dart';
import 'package:supercharged/supercharged.dart';

AppBar defaultAppBar({
  required bool hasBackButton,
  required BuildContext context,
}) =>
    AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );

/// Guide on [appBarWithTwoPaginationProgress]
///
///
PreferredSize appBarWithTwoPaginationProgress({
  required BuildContext context,
  required Widget twoPaginationProgress,
}) {
  return PreferredSize(
    preferredSize: const Size(double.maxFinite, 80),
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
          child: Container(
            color: Colors.black,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              constraints: const BoxConstraints.expand(height: 80),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.0),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                AnimatedSwitcher(
                  duration: 500.milliseconds,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                )
              ],
            ),
            twoPaginationProgress,
          ],
        ),
      ],
    ),
  );
}

class AppBarWithTwoPaginationProgress extends StatelessWidget
    implements PreferredSizeWidget {
  final BlocBuilder<TwoPaginationProgressCubit, TwoPaginationProgressState>
      twoPaginationProgress;
  final Function()? backButton;
  final Function()? closeButton;

  const AppBarWithTwoPaginationProgress(
      {Key? key,
      required this.twoPaginationProgress,
      required this.backButton,
      required this.closeButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.maxFinite, 80),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
            child: Container(
              color: Theme.of(context).backgroundColor,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 80),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).backgroundColor,
                      Theme.of(context).backgroundColor.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  BlocBuilder<TwoPaginationProgressCubit,
                      TwoPaginationProgressState>(
                    builder: (context, state) {
                      bool isFirstPage;
                      if (state.currentProgressIndex == 1) {
                        isFirstPage = true;
                      } else {
                        isFirstPage = false;
                      }

                      return AnimatedSwitcher(
                        duration: 250.milliseconds,
                        switchInCurve: Curves.easeOutExpo,
                        switchOutCurve: Curves.easeInExpo,
                        transitionBuilder: (child, animation) {
                          final inAnimation = Tween<Offset>(
                            begin: const Offset(-1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation);

                          return SlideTransition(
                            position: inAnimation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child: isFirstPage
                            ? closeIconButton()
                            : arrowBackIconButton(),
                      );
                    },
                  )
                ],
              ),
              twoPaginationProgress,
            ],
          ),
        ],
      ),
    );
  }

  IconButton arrowBackIconButton() {
    return IconButton(
      key: const Key('arrow_back_icon_button'),
      onPressed: backButton,
      icon: const Icon(Icons.arrow_back),
    );
  }

  IconButton closeIconButton() {
    return IconButton(
      key: const Key('close_icon_button'),
      onPressed: closeButton,
      icon: const Icon(Icons.close),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
