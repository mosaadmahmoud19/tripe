

import 'package:trip_app/models/get_all_nationality_model.dart';
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

/////////////// get allNationality
class ChangeNationalityState extends TripeRegisterStates {}


class TripeGetAllNationalityLoadingState extends TripeRegisterStates {}

class TripeRegisterGetAllNationalitySuccessState extends TripeRegisterStates
{

  final GetAllNationalityModel getAllNationalityModel ;

  TripeRegisterGetAllNationalitySuccessState(this.getAllNationalityModel);
}

class TripeRegisterGetAllNationalityErrorState extends TripeRegisterStates
{
  final String error;


  TripeRegisterGetAllNationalityErrorState(this.error);

}

//////////////////////////////

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

