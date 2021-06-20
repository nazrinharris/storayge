import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import 'two_pagination_progress_cubit.dart';

/// Guide on using [TwoPaginationProgress]
///
/// To use [TwoPaginationProgress], consider how this widget works.
///
/// Important! This widget only works when the Row of this widget occupies the full length of the screen.
/// The height is negligible.
///
/// First, do not use the [TwoPaginationProgress] widget directly, instead use the predefined method :
/// `buildTwoPaginationProgress(screenWidth)`
/// and provide it with the screenWidth
///
/// Second, the widget works by first creating a Row with an undefined width and height. Take that into account.
///
/// Third, make sure that the `BuildContext` of this widget's ancestor has the cubit [TwoPaginationProgressCubit].
/// You may use the [Builder] widget to access the correct context.
///
/// Of course, do not forget to provide the cubit using `BlocProvider`
///
/// Finally, to trigger the action of the first page and second page, retrieve the [TwoPaginationProgressCubit] and
/// use this (or any other similar ways) :
///
/// `context.read<TwoPaginationProgressCubit>().state.triggerFirstPage` to highlight the first circle.
///
/// `context.read<TwoPaginationProgressCubit>().state.triggerSecondPage` to highlight the second circle.
///
/// More info :
///
/// This widget operates by modifying the [AnimatedContainer] present at the left side. The movement
/// of the circles are dictated by the length of the [AnimatedContainer]
///
BlocBuilder<TwoPaginationProgressCubit, TwoPaginationProgressState>
    buildTwoPaginationProgress(double screenWidth) {
  return BlocBuilder<TwoPaginationProgressCubit, TwoPaginationProgressState>(
    builder: (context, state) => TwoPaginationProgress(
      screenWidth: screenWidth,
      leftSideLength:
          context.read<TwoPaginationProgressCubit>().state.leftSideLength,
      firstCircleLength:
          context.read<TwoPaginationProgressCubit>().state.firstCircleLength,
      firstCircleOpacity:
          context.read<TwoPaginationProgressCubit>().state.firstCircleOpacity,
      firstCircleNumber:
          context.read<TwoPaginationProgressCubit>().state.firstCircleNumber,
      firstCircleNumberSize: context
          .read<TwoPaginationProgressCubit>()
          .state
          .firstCircleNumberSize,
      secondCircleLength:
          context.read<TwoPaginationProgressCubit>().state.secondCircleLength,
      secondCircleOpacity:
          context.read<TwoPaginationProgressCubit>().state.secondCircleOpacity,
      secondCircleNumber:
          context.read<TwoPaginationProgressCubit>().state.secondCircleNumber,
      secondCircleNumberSize: context
          .read<TwoPaginationProgressCubit>()
          .state
          .secondCircleNumberSize,
    ),
  );
}

class TwoPaginationProgress extends StatelessWidget {
  const TwoPaginationProgress({
    Key? key,
    // Others
    required this.leftSideLength,
    required this.screenWidth,
    // First circle attributes
    required this.firstCircleLength,
    required this.firstCircleOpacity,
    required this.firstCircleNumber,
    required this.firstCircleNumberSize,
    // Second circle attributes
    required this.secondCircleOpacity,
    required this.secondCircleLength,
    required this.secondCircleNumber,
    required this.secondCircleNumberSize,
  }) : super(key: key);

  final double leftSideLength;
  final double screenWidth;

  final double firstCircleLength;
  final double firstCircleOpacity;
  final int firstCircleNumber;
  final double firstCircleNumberSize;

  final double secondCircleLength;
  final double secondCircleOpacity;
  final int secondCircleNumber;
  final double secondCircleNumberSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: leftSideLength,
          height: screenWidth * 0.0845,
          curve: Curves.easeOutExpo,
        ),
        Row(
          children: [
            AnimatedOpacity(
              opacity: firstCircleOpacity,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutExpo,
              child: Material(
                color: kcTertiaryColor,
                borderRadius: BorderRadius.circular(100),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutExpo,
                  alignment: Alignment.center,
                  width: firstCircleLength,
                  height: firstCircleLength,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    style: ktsHeadingParagraph.copyWith(
                        fontSize: firstCircleNumberSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    child: Text('$firstCircleNumber'),
                  ),
                ),
              ),
            ),
            horizontalSpace10,
            AnimatedOpacity(
              opacity: secondCircleOpacity,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutExpo,
              child: Material(
                color: kcTertiaryColor,
                borderRadius: BorderRadius.circular(100),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutExpo,
                  alignment: Alignment.center,
                  width: secondCircleLength,
                  height: secondCircleLength,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutExpo,
                    style: ktsHeadingParagraph.copyWith(
                        fontSize: secondCircleNumberSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    child: Text('$secondCircleNumber'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
