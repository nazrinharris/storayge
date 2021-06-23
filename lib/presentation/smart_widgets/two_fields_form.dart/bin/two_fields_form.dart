part of 'two_fields_form_cubit.dart';

class TwoFieldsForm extends StatelessWidget {
  final String firstFieldLabel;
  final String firstFieldHintText;

  final String secondFieldLabel;
  final String secondFieldHintText;

  const TwoFieldsForm({
    Key? key,
    required this.firstFieldLabel,
    required this.firstFieldHintText,
    required this.secondFieldLabel,
    required this.secondFieldHintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TwoValueListenableBuilder(
      firstListenable: _readCubitState(context).isFirstTimeWithFirstField,
      secondListenable: _readCubitState(context).isFirstTimeWithSecondField,
      builder: (context, first, second, child) {
        return Form(
          key: _readCubitState(context).formKey,
          child: Column(
            children: [
              _TextFieldLabelText(firstFieldLabel),
              TextFormField(
                  focusNode: _readCubitState(context).firstFieldFocusNode,
                  onChanged: (value) {
                    // Should update the cubit's local username value.
                    //             _readCubitState(context).firstFieldValueChanged(value);
                  },
                  onFieldSubmitted: (value) {
                    // Should validate the current value and proceed to focus on the next field.
                    //             _readCubitState(context).focusOnEmailTextField();
                    //           _readCubitState(context).validateUsernameField();
                  },
                  textInputAction: TextInputAction.next,
                  //     validator: validateUsername,
                  // Should read this TextField's validation mode from cubit.
                  //    autovalidateMode:
                  //          _readCubitState(context).autovalidteModeUsernameField,
                  // Should read the cubit's local username value
                  //initialValue: _readCubitState(context).usernameValue,
                  style: appBodyText1(context),
                  decoration: kInputDecoration(
                    context: context,
                    hintText: 'Enter your desired username',
                  )),
              verticalSpace34,
              const _TextFieldLabelText('Email'),
              TextFormField(
                  // controller: _readCubit(context).emailFieldController,
                  //focusNode: context.read<RegisterViewCubit>().emailFocusNode,
                  // onChanged: (value) {
                  //   _readCubitState(context).triggerUsernameAndOrEmailValueChanged(
                  //       newEmailValue: value);
                  // },
                  // onFieldSubmitted: (value) {
                  //   _readCubitState(context).validateEmailField();
                  //   setState(() {
                  //     _readCubitState(context).validateEmailField();
                  //   });
                  // },
                  // validator: validateEmail,
                  // autovalidateMode: watchRegisterViewCubit(context)
                  //     .autovalidateModeEmailField,
                  // initialValue: _readCubitState(context).emailValue,
                  style: appTextTheme(context).bodyText1,
                  decoration: kInputDecoration(
                    context: context,
                    hintText: 'Enter your email',
                  )),
              verticalSpace14,
            ],
          ),
        );
      },
      child: const SizedBox(),
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
