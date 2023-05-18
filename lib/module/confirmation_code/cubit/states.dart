
import 'package:trip_app/models/confirmation_code_model.dart';

abstract class ConfirmationCodeStates{}

class ConfirmationCodeInitialStates extends ConfirmationCodeStates{}

class ConfirmationCodeLoadingState extends ConfirmationCodeStates {}

class ConfirmationCodeSuccessState extends ConfirmationCodeStates
{
  final ConfirmationCodeModel confirmationCodeModel;

  ConfirmationCodeSuccessState(this.confirmationCodeModel);
}

class ConfirmationCodeErrorState extends ConfirmationCodeStates
{
  final String error;

  ConfirmationCodeErrorState(this.error);
}
