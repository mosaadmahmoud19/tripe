


import 'package:trip_app/models/check_code_model.dart';
import 'package:trip_app/models/goggle_signin_model.dart';
import 'package:trip_app/models/login_model.dart';
import 'package:trip_app/models/reset_password_model.dart';
import 'package:trip_app/models/send_code_to_your_phone_model.dart';

abstract class TripeLoginStates {}

class TripeLoginInitialState extends TripeLoginStates {}

class TripeLoginLoadingState extends TripeLoginStates {}

class TripeLoginSuccessState extends TripeLoginStates
{

  final LoginModel loginModel;

  TripeLoginSuccessState(this.loginModel);
}

class TripeLoginErrorState extends TripeLoginStates
{
  final String error;


  TripeLoginErrorState(this.error);

}


class TripeSignInGoogleLoadingState extends TripeLoginStates {}

class TripeSignInGoogleSuccessState extends TripeLoginStates
{

  final GoogleSignInModel googleSignInModel;

  TripeSignInGoogleSuccessState(this.googleSignInModel);

}

class TripeSignInGoogleErrorState extends TripeLoginStates
{
  final String error;


  TripeSignInGoogleErrorState(this.error);

}

class TripeChangePasswordVisibilityState extends TripeLoginStates {}

class TripeChangeConfirmPasswordVisibilityStates extends TripeLoginStates {}

// send code your phone
class SendCodeYourPhoneLoadingState extends TripeLoginStates {}

class SendCodeYourPhoneSuccessState extends TripeLoginStates
{

  final SendCodeYourPhoneModel sendCodeYourPhoneModel;

  SendCodeYourPhoneSuccessState(this.sendCodeYourPhoneModel);

}

class SendCodeYourPhoneErrorState extends TripeLoginStates
{
  final String error;


  SendCodeYourPhoneErrorState(this.error);

}

// check code

class CheckCodeLoadingState extends TripeLoginStates {}

class CheckCodeSuccessState extends TripeLoginStates
{

  final CheckCodeModel checkCodeModel;

  CheckCodeSuccessState(this.checkCodeModel);

}

class CheckCodeErrorState extends TripeLoginStates
{
  final String error;


  CheckCodeErrorState(this.error);

}

// reset password

class ResetPasswordLoadingState extends TripeLoginStates {}

class ResetPasswordSuccessState extends TripeLoginStates
{

  final ResetPasswordModel resetPasswordModel;

  ResetPasswordSuccessState(this.resetPasswordModel);

}

class ResetPasswordErrorState extends TripeLoginStates
{
  final String error;


  ResetPasswordErrorState(this.error);

}