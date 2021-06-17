import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'three_pagination_progress_state.dart';

class ThreePaginationProgressCubit extends Cubit<ThreePaginationProgressState> {
  final double screenWidth;
  final double screenHeight;

  static double halfScreen(double screenWidth) => screenWidth / 2;
  static double smallCircle(double screenWidth) => screenWidth * 0.0555;
  static double largeCircle(double screenWidth) => screenWidth * 0.0845;
  static double halfLargeCircle(double screenWidth) => screenWidth * 0.0845 / 2;

  ThreePaginationProgressCubit({
    required this.screenHeight,
    required this.screenWidth,
  }) : super(ThreePaginationProgressState(
          currentProgressIndex: 1,
          halfScreen: halfScreen(screenWidth),
          leftSideLength:
              halfScreen(screenWidth) - halfLargeCircle(screenWidth),
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          firstCircleLength: largeCircle(screenWidth),
          firstCircleOpacity: 1,
          firstCircleNumber: 1,
          firstCircleNumberSize: 16,
          secondCircleLength: smallCircle(screenWidth),
          secondCircleOpacity: 0.25,
          secondCircleNumber: 2,
          secondCircleNumberSize: 8,
          thirdCircleLength: smallCircle(screenWidth),
          thirdCircleOpacity: 0.25,
          thirdCircleNumber: 3,
          thirdCircleNumberSize: 8,
        ));

  void triggerFirstPage() {
    emit(ThreePaginationProgressState(
      currentProgressIndex: 1,
      halfScreen: halfScreen(screenWidth),
      leftSideLength: halfScreen(screenWidth) - halfLargeCircle(screenWidth),
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      firstCircleLength: largeCircle(screenWidth),
      firstCircleOpacity: 1,
      firstCircleNumber: 1,
      firstCircleNumberSize: 16,
      secondCircleLength: smallCircle(screenWidth),
      secondCircleOpacity: 0.25,
      secondCircleNumber: 2,
      secondCircleNumberSize: 8,
      thirdCircleLength: smallCircle(screenWidth),
      thirdCircleOpacity: 0.25,
      thirdCircleNumber: 3,
      thirdCircleNumberSize: 8,
    ));
  }

  void triggerSecondPage() {
    emit(ThreePaginationProgressState(
      currentProgressIndex: 2,
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      halfScreen: screenWidth / 2,
      leftSideLength: (screenWidth / 2) -
          10 -
          (screenWidth * 0.0845 / 2) -
          (screenWidth * 0.0555),
      firstCircleLength: screenWidth * 0.0555,
      firstCircleOpacity: 0.25,
      firstCircleNumber: 1,
      firstCircleNumberSize: 8,
      secondCircleLength: screenWidth * 0.0845,
      secondCircleOpacity: 1,
      secondCircleNumber: 2,
      secondCircleNumberSize: 16,
      thirdCircleLength: screenWidth * 0.0555,
      thirdCircleOpacity: 0.25,
      thirdCircleNumber: 3,
      thirdCircleNumberSize: 8,
    ));
  }

  void triggerThirdPage() {
    emit(ThreePaginationProgressState(
      currentProgressIndex: 3,
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      halfScreen: screenWidth / 2,
      leftSideLength: (screenWidth / 2) -
          2 * (screenWidth * 0.0555) -
          20 -
          (screenWidth * 0.0845 / 2),
      firstCircleLength: screenWidth * 0.0555,
      firstCircleOpacity: 0.25,
      firstCircleNumber: 1,
      firstCircleNumberSize: 8,
      secondCircleLength: screenWidth * 0.0555,
      secondCircleOpacity: 0.25,
      secondCircleNumber: 2,
      secondCircleNumberSize: 8,
      thirdCircleLength: screenWidth * 0.0845,
      thirdCircleOpacity: 1,
      thirdCircleNumber: 3,
      thirdCircleNumberSize: 16,
    ));
  }
}
