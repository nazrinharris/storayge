part of 'two_fields_form_bloc.dart';

@freezed
class TwoFieldsFormProperties with _$TwoFieldsFormProperties {
  const factory TwoFieldsFormProperties({
    required AutovalidateMode autovalidateModeFirstField,
    required AutovalidateMode autovalidateModeSecondField,
    required FocusNode firstFieldFocusNode,
    required FocusNode secondFieldFocusNode,
    required String? firstFieldValue,
    required String? secondFieldValue,
    required GlobalKey<FormState> formKey,
  }) = _TwoFieldsFormProperties;
}
