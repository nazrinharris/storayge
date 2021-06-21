import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import 'three_pagination_progress_cubit.dart';

// TODO: Create documentation
BlocBuilder<ThreePaginationProgressCubit, ThreePaginationProgressState>
    buildThreePaginationProgress(double screenWidth) {
  return BlocBuilder<ThreePaginationProgressCubit,
      ThreePaginationProgressState>(
    builder: (cubit, context) => ThreePaginationProgress(
      screenWidth: screenWidth,
      leftSideLength:
          cubit.read<ThreePaginationProgressCubit>().state.leftSideLength,
      firstCircleLength:
          cubit.read<ThreePaginationProgressCubit>().state.firstCircleLength,
      firstCircleOpacity:
          cubit.read<ThreePaginationProgressCubit>().state.firstCircleOpacity,
      firstCircleNumber:
          cubit.read<ThreePaginationProgressCubit>().state.firstCircleNumber,
      firstCircleNumberSize: cubit
          .read<ThreePaginationProgressCubit>()
          .state
          .firstCircleNumberSize,
      secondCircleLength:
          cubit.read<ThreePaginationProgressCubit>().state.secondCircleLength,
      secondCircleOpacity:
          cubit.read<ThreePaginationProgressCubit>().state.secondCircleOpacity,
      secondCircleNumber:
          cubit.read<ThreePaginationProgressCubit>().state.secondCircleNumber,
      secondCircleNumberSize: cubit
          .read<ThreePaginationProgressCubit>()
          .state
          .secondCircleNumberSize,
      thirdCircleLength:
          cubit.read<ThreePaginationProgressCubit>().state.thirdCircleLength,
      thirdCircleOpacity:
          cubit.read<ThreePaginationProgressCubit>().state.thirdCircleOpacity,
      thirdCircleNumber:
          cubit.read<ThreePaginationProgressCubit>().state.thirdCircleNumber,
      thirdCircleNumberSize: cubit
          .read<ThreePaginationProgressCubit>()
          .state
          .thirdCircleNumberSize,
    ),
  );
}

class ThreePaginationProgress extends StatelessWidget {
  const ThreePaginationProgress({
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
    // Third circle attributes
    required this.thirdCircleOpacity,
    required this.thirdCircleLength,
    required this.thirdCircleNumber,
    required this.thirdCircleNumberSize,
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

  final double thirdCircleLength;
  final double thirdCircleOpacity;
  final int thirdCircleNumber;
  final double thirdCircleNumberSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: leftSideLength,
          height: screenWidth * 0.0845,
          curve: Curves.easeOutExpo,
        ),
        Row(
          children: [
            AnimatedOpacity(
              opacity: firstCircleOpacity,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              child: Material(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(100),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutExpo,
                  alignment: Alignment.center,
                  width: firstCircleLength,
                  height: firstCircleLength,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutExpo,
                    style: appTextTheme(context).headline3!.copyWith(
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
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              child: Material(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(100),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutExpo,
                  alignment: Alignment.center,
                  width: secondCircleLength,
                  height: secondCircleLength,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutExpo,
                    style: appTextTheme(context).headline3!.copyWith(
                        fontSize: secondCircleNumberSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    child: Text('$secondCircleNumber'),
                  ),
                ),
              ),
            ),
            horizontalSpace10,
            AnimatedOpacity(
              opacity: thirdCircleOpacity,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              child: Material(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(100),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutExpo,
                  alignment: Alignment.center,
                  width: thirdCircleLength,
                  height: thirdCircleLength,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutExpo,
                    style: appTextTheme(context).headline3!.copyWith(
                        fontSize: thirdCircleNumberSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    child: Text('$thirdCircleNumber'),
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
