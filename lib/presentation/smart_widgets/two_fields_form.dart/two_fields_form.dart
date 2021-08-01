part of 'two_fields_form_bloc.dart';

class TwoFieldsForm<T extends Bloc<TwoFieldsFormEvent, TwoFieldsFormState>>
    extends StatelessWidget {
  final String firstFieldLabel;
  final String firstFieldHintText;

  final String secondFieldLabel;
  final String secondFieldHintText;

  final String? Function(String?)? validateFirstField, validateSecondField;

  final bool? isFirstFieldObscured;
  final bool? isSecondFieldObscured;

  const TwoFieldsForm({
    Key? key,
    required this.firstFieldLabel,
    required this.firstFieldHintText,
    required this.secondFieldLabel,
    required this.secondFieldHintText,
    required this.validateFirstField,
    required this.validateSecondField,
    this.isFirstFieldObscured,
    this.isSecondFieldObscured,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, TwoFieldsFormState>(
      builder: (context, state) {
        TwoFieldsFormState _readBlocState(BuildContext mainContext) =>
            BlocProvider.of<T>(mainContext).state;

        T _readBloc(BuildContext mainContext) =>
            BlocProvider.of<T>(mainContext);

        return Form(
          key: _readBlocState(context).props.formKey,
          child: Column(
            children: [
              _TextFieldLabelText(firstFieldLabel),
              TextFormField(
                  focusNode: _readBlocState(context).props.firstFieldFocusNode,
                  onChanged: (input) {
                    // Should update the cubit's local username value.
                    _readBloc(context).add(
                        TwoFieldsFormEvent.firstFieldValueChanged(
                            input: input));
                  },
                  onFieldSubmitted: (value) {
                    // Should validate the current value and proceed to focus on the next field.
                    _readBloc(context)
                        .add(const TwoFieldsFormEvent.firstFieldSubmitted());
                  },
                  textInputAction: TextInputAction.next,
                  validator: validateFirstField,
                  // Should read this TextField's validation mode from cubit.
                  autovalidateMode:
                      _readBlocState(context).props.autovalidateModeFirstField,
                  // Should read the cubit's local username value
                  initialValue: _readBlocState(context).props.firstFieldValue,
                  style: appBodyText1(context),
                  obscureText: isFirstFieldObscured ?? false,
                  decoration: kInputDecoration(
                    context: context,
                    hintText: firstFieldHintText,
                  )),
              verticalSpace34,
              _TextFieldLabelText(secondFieldLabel),
              TextFormField(
                  focusNode: _readBlocState(context).props.secondFieldFocusNode,
                  onChanged: (input) {
                    _readBloc(context).add(
                        TwoFieldsFormEvent.secondFieldValueChanged(
                            input: input));
                  },
                  onFieldSubmitted: (value) {
                    _readBloc(context)
                        .add(const TwoFieldsFormEvent.secondFieldSubmitted());
                  },
                  validator: validateSecondField,
                  autovalidateMode:
                      _readBlocState(context).props.autovalidateModeSecondField,
                  initialValue: _readBlocState(context).props.secondFieldValue,
                  style: appTextTheme(context).bodyText1,
                  obscureText: isSecondFieldObscured ?? false,
                  decoration: kInputDecoration(
                    context: context,
                    hintText: secondFieldHintText,
                  )),
              verticalSpace14,
            ],
          ),
        );
      },
    );
  }
}

class _TextFieldLabelText extends StatelessWidget {
  final String labelText;
  const _TextFieldLabelText(this.labelText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: appHeadline3(context),
      ),
    );
  }
}
