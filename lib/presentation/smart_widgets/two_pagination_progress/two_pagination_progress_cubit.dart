import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'two_pagination_progress_state.dart';

class TwoPaginationProgressCubit extends Cubit<TwoPaginationProgressState> {
  final double screenWidth;
  final double screenHeight;

  TwoPaginationProgressCubit({
    required this.screenHeight,
    required this.screenWidth,
  }) : super(TwoPaginationProgressState(
          currentProgressIndex: 1,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          halfScreen: screenWidth / 2,
          leftSideLength: (screenWidth / 2) - (screenWidth * 0.0845 / 2),
          firstCircleLength: screenWidth * 0.0845,
          firstCircleOpacity: 1,
          firstCircleNumber: 1,
          firstCircleNumberSize: 16,
          secondCircleLength: screenWidth * 0.0555,
          secondCircleOpacity: 0.25,
          secondCircleNumber: 2,
          secondCircleNumberSize: 8,
        ));

  void triggerFirstPage() {
    emit(TwoPaginationProgressState(
      currentProgressIndex: 1,
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      halfScreen: screenWidth / 2,
      leftSideLength: (screenWidth / 2) - (screenWidth * 0.0845 / 2),
      firstCircleLength: screenWidth * 0.0845,
      firstCircleOpacity: 1,
      firstCircleNumber: 1,
      firstCircleNumberSize: 16,
      secondCircleLength: screenWidth * 0.0555,
      secondCircleOpacity: 0.25,
      secondCircleNumber: 2,
      secondCircleNumberSize: 8,
    ));
  }

  void triggerSecondPage() {
    emit(TwoPaginationProgressState(
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
    ));
  }
}
