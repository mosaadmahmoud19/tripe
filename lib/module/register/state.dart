

import 'package:trip_app/models/goggle_signin_model.dart';
import 'package:trip_app/models/register_model.dart';

abstract class TripeRegisterStates {}

class TripeRegisterInitialState extends TripeRegisterStates {}

class TripeRegisterLoadingState extends TripeRegisterStates {}

class TripeRegisterSuccessState extends TripeRegisterStates
{

  final RegisterModel registerModel;

  TripeRegisterSuccessState(this.registerModel);
}

class TripeRegisterErrorState extends TripeRegisterStates
{
  final String error;


  TripeRegisterErrorState(this.error);

}

class TripeSignInGoogleLoadingState extends TripeRegisterStates {}

class TripeSignInGoogleSuccessState extends TripeRegisterStates
{

  final GoogleSignInModel googleSignInModel;

  TripeSignInGoogleSuccessState(this.googleSignInModel);

}

class TripeSignInGoogleErrorState extends TripeRegisterStates
{
  final String error;


  TripeSignInGoogleErrorState(this.error);

}


class TripeChangePasswordVisibilityStates extends TripeRegisterStates {}

class TripeChangeConfirmPasswordVisibilityStates extends TripeRegisterStates {}

