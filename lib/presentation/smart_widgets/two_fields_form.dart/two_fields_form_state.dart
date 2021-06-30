part of 'two_fields_form_bloc.dart';

@freezed
class TwoFieldsFormState with _$TwoFieldsFormState {
  const factory TwoFieldsFormState.initial(
      {required TwoFieldsFormProperties props}) = _FormInitial;
  const factory TwoFieldsFormState.formValidationSuccess(
      {required TwoFieldsFormProperties props}) = _FormValidationSuccess;
}
