part of 'two_fields_form_bloc.dart';

TwoFieldsFormEvent unfocusAllNodes = const TwoFieldsFormEvent.unfocusAllNodes();
TwoFieldsFormEvent enableAlwaysValidation =
    const TwoFieldsFormEvent.enableAlwaysValidation();

@freezed
class TwoFieldsFormEvent with _$TwoFieldsFormEvent {
  const factory TwoFieldsFormEvent.started() = _TwoFieldsFormStarted;
  const factory TwoFieldsFormEvent.unfocusAllNodes() =
      _TwoFieldsFormUnfocusAllNodes;
  const factory TwoFieldsFormEvent.firstFieldValueChanged(
      {required String input}) = _TwoFieldsFormFirstFieldValueChanged;
  const factory TwoFieldsFormEvent.secondFieldValueChanged(
      {required String input}) = _TwoFieldsFormSecondFieldValueChanged;
  const factory TwoFieldsFormEvent.firstFieldSubmitted() =
      _TwoFieldsFormFirstFieldSubmitted;
  const factory TwoFieldsFormEvent.secondFieldSubmitted() =
      _TwoFieldsFormSecondFieldSubmitted;
  const factory TwoFieldsFormEvent.enableAlwaysValidation() =
      _TwoFieldsFormEnableAlwaysValidation;
}
