part of 'two_fields_form_cubit.dart';

class TwoFieldsFormState extends Equatable {
  final ValueNotifier<bool> isFirstTimeWithFirstField,
      isFirstTimeWithSecondField;

  final AutovalidateMode autovalidateModeFirstField,
      autovalidateModeSecondField;

  final GlobalKey<FormState> formKey;

  final FocusNode firstFieldFocusNode, secondFieldFocusNode;

  final String? firstFieldValue, secondFieldValue;

  const TwoFieldsFormState({
    required this.isFirstTimeWithFirstField,
    required this.isFirstTimeWithSecondField,
    required this.autovalidateModeFirstField,
    required this.autovalidateModeSecondField,
    required this.formKey,
    required this.firstFieldFocusNode,
    required this.secondFieldFocusNode,
    required this.firstFieldValue,
    required this.secondFieldValue,
  });

  @override
  List<Object> get props => [];
}
