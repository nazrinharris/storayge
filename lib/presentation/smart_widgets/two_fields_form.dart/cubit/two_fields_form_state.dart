part of 'two_fields_form_cubit.dart';

@freezed
class TwoFieldsFormState with _$TwoFieldsFormState {
  const factory TwoFieldsFormState({
    required bool isFirstTimeWithFirstField,
    required bool isFirstTimeWithSecondField,
    required AutovalidateMode autovalidateModeFirstField,
    required AutovalidateMode autovalidateModeSecondField,
    required GlobalKey<FormState> formKey,
    required FocusNode firstFieldFocusNode,
    required FocusNode secondFieldFocusNode,
    required String? firstFieldValue,
    required String? secondFieldValue,
  }) = _TwoFieldsFormState;

  factory TwoFieldsFormState.initial() => TwoFieldsFormState(
        isFirstTimeWithFirstField: true,
        isFirstTimeWithSecondField: true,
        autovalidateModeFirstField: AutovalidateMode.disabled,
        autovalidateModeSecondField: AutovalidateMode.disabled,
        formKey: GlobalKey<FormState>(),
        firstFieldFocusNode: FocusNode(),
        secondFieldFocusNode: FocusNode(),
        firstFieldValue: null,
        secondFieldValue: null,
      );
}
