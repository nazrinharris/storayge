part of 'list_screen_bloc.dart';

@freezed
class ListScreenEvent with _$ListScreenEvent {
  const factory ListScreenEvent.started() = _Started;
  const factory ListScreenEvent.execGetAllListSGSnip() = LSexecGetAllListSGSnip;
}
