import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';

part 'register_view_state.dart';

class RegisterViewCubit extends Cubit<RegisterViewState> {
  late CustomAnimationControl controlFirstPage;
  late CustomAnimationControl controlSecondPage;

  RegisterViewCubit() : super(RegisterViewFirstPage()) {
    controlFirstPage = CustomAnimationControl.play;
    controlSecondPage = CustomAnimationControl.stop;
  }

  void triggerFirstPage() {
    controlFirstPage = CustomAnimationControl.play;
    controlSecondPage = CustomAnimationControl.playReverse;
    emit(RegisterViewFirstPage());
  }

  void triggerSecondPage() {
    controlSecondPage = CustomAnimationControl.play;
    controlFirstPage = CustomAnimationControl.playReverse;
    emit(RegisterViewSecondPage());
  }
}
