import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:storayge/core/helper_widgets/two_value_listenable_builder.dart';
import 'package:flutter/material.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/styles.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';

part 'two_fields_form_state.dart';
part 'two_fields_form.dart';

TwoFieldsFormState _readCubitState(BuildContext context) =>
    BlocProvider.of<TwoFieldsFormCubit>(context).state;

class TwoFieldsFormCubit extends Cubit<TwoFieldsFormState> {
  // late ValueNotifier<bool> isFirstInteractionWithFirstField,
  //     isFirstInteractionWithSecondField;

  // late AutovalidateMode autovalidateModeFirstField, autovalidateModeSecondField;

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final FocusNode firstFieldFocusNode = FocusNode();
  static final FocusNode secondFieldFocusNode = FocusNode();

  static String? firstFieldValue;
  static String? secondFieldValue;

  // late FocusNode firstFieldFocusNode, secondFieldFocusNode;

  // late String? firstFieldValue, secondFieldValue;

  TwoFieldsFormCubit()
      : super(
          TwoFieldsFormState(
            isFirstTimeWithFirstField: ValueNotifier<bool>(true),
            isFirstTimeWithSecondField: ValueNotifier<bool>(true),
            autovalidateModeFirstField: AutovalidateMode.disabled,
            autovalidateModeSecondField: AutovalidateMode.disabled,
            formKey: formKey,
            firstFieldFocusNode: firstFieldFocusNode,
            secondFieldFocusNode: secondFieldFocusNode,
            firstFieldValue: firstFieldValue,
            secondFieldValue: secondFieldValue,
          ),
        ) {
    // isFirstInteractionWithFirstField = ValueNotifier<bool>(true);
    // isFirstInteractionWithSecondField = ValueNotifier<bool>(true);
    // firstFieldFocusNode = FocusNode();
    // secondFieldFocusNode = FocusNode();
    // firstFieldValue = null;
    // secondFieldValue = null;
  }

  void firstFieldValueChanged(String input) {}
}
