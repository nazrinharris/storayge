part of 'two_pagination_progress_cubit.dart';

class TwoPaginationProgressState extends Equatable {
  final double screenWidth;
  final double screenHeight;

  final double firstCircleLength;
  final double firstCircleOpacity;
  final int firstCircleNumber;
  final double firstCircleNumberSize;

  final double secondCircleLength;
  final double secondCircleOpacity;
  final int secondCircleNumber;
  final double secondCircleNumberSize;

  final double halfScreen;
  final double leftSideLength;

  final int currentProgressIndex;

  const TwoPaginationProgressState({
    // Others
    required this.currentProgressIndex,
    required this.halfScreen,
    required this.leftSideLength,
    required this.screenHeight,
    required this.screenWidth,
    // First circle attributes
    required this.firstCircleLength,
    required this.firstCircleOpacity,
    required this.firstCircleNumber,
    required this.firstCircleNumberSize,
    // Second circle attributes
    required this.secondCircleLength,
    required this.secondCircleOpacity,
    required this.secondCircleNumber,
    required this.secondCircleNumberSize,
  });

  @override
  List<Object> get props => [
        currentProgressIndex,
        firstCircleLength,
        firstCircleOpacity,
        firstCircleNumber,
        firstCircleNumberSize,
        secondCircleLength,
        secondCircleOpacity,
        secondCircleNumber,
        secondCircleNumberSize,
        screenWidth,
        screenHeight,
        leftSideLength,
        halfScreen,
      ];
}
