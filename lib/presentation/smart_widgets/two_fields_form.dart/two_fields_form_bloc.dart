import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/shared/styles.dart';
import 'package:storayge/presentation/shared/ui_helpers.dart';

part 'two_fields_form_event.dart';
part 'two_fields_form_state.dart';
part 'two_fields_form_bloc.freezed.dart';
part 'two_fields_form.dart';
part 'two_fields_form_properties.dart';

FirstTwoFieldsFormBloc readFirstFormBloc(BuildContext context) =>
    BlocProvider.of<FirstTwoFieldsFormBloc>(context);

SecondTwoFieldsFormBloc readSecondFormBloc(BuildContext context) =>
    BlocProvider.of<SecondTwoFieldsFormBloc>(context);

mixin FirstTwoFieldsFormBloc on Bloc<TwoFieldsFormEvent, TwoFieldsFormState> {}

mixin SecondTwoFieldsFormBloc on Bloc<TwoFieldsFormEvent, TwoFieldsFormState> {}

class TwoFieldsFormBloc extends Bloc<TwoFieldsFormEvent, TwoFieldsFormState>
    with FirstTwoFieldsFormBloc, SecondTwoFieldsFormBloc {
  TwoFieldsFormBloc()
      : super(
          TwoFieldsFormState.initial(
            props: TwoFieldsFormProperties(
              autovalidateModeFirstField: AutovalidateMode.disabled,
              autovalidateModeSecondField: AutovalidateMode.disabled,
              firstFieldFocusNode: FocusNode(),
              secondFieldFocusNode: FocusNode(),
              firstFieldValue: null,
              secondFieldValue: null,
              formKey: GlobalKey<FormState>(),
            ),
          ),
        );

  @override
  Stream<TwoFieldsFormState> mapEventToState(
    TwoFieldsFormEvent event,
  ) async* {
    yield* event.map(
      started: (_) async* {
        yield TwoFieldsFormState.initial(
          props: state.props,
        );
      },
      unfocusAllNodes: (_) async* {
        state.props.firstFieldFocusNode.unfocus();
        state.props.secondFieldFocusNode.unfocus();
        yield state;
      },
      firstFieldValueChanged:
          (_TwoFieldsFormFirstFieldValueChanged event) async* {
        yield state.copyWith(
            props: state.props.copyWith(firstFieldValue: event.input));
      },
      secondFieldValueChanged:
          (_TwoFieldsFormSecondFieldValueChanged event) async* {
        yield state.copyWith(
            props: state.props.copyWith(secondFieldValue: event.input));
      },
      firstFieldSubmitted: (_TwoFieldsFormFirstFieldSubmitted value) async* {
        state.props.secondFieldFocusNode.requestFocus();

        yield state.copyWith(
            props: state.props.copyWith(
          autovalidateModeFirstField: AutovalidateMode.always,
        ));
      },
      secondFieldSubmitted: (_TwoFieldsFormSecondFieldSubmitted value) async* {
        yield state.copyWith(
            props: state.props.copyWith(
          autovalidateModeSecondField: AutovalidateMode.always,
        ));
      },
      enableAlwaysValidation:
          (_TwoFieldsFormEnableAlwaysValidation value) async* {
        yield state.copyWith(
            props: state.props.copyWith(
          autovalidateModeFirstField: AutovalidateMode.always,
          autovalidateModeSecondField: AutovalidateMode.always,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    state
      ..props.firstFieldFocusNode.dispose()
      ..props.secondFieldFocusNode.dispose();

    return super.close();
  }
}
