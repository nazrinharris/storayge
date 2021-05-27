part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetStoraygeUserEvent extends HomeEvent {
  final String uid;

  const GetStoraygeUserEvent({
    required this.uid,
  });
}
