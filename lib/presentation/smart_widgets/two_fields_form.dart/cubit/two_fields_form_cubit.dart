import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'two_fields_form_state.dart';
part 'two_fields_form_cubit.freezed.dart';

class TwoFieldsFormCubit extends Cubit<TwoFieldsFormState> {
  TwoFieldsFormCubit() : super(TwoFieldsFormState.initial());
}
