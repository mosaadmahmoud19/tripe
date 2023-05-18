import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_app/models/goggle_signin_model.dart';
import 'package:trip_app/models/register_model.dart';
import 'package:trip_app/module/register/state.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';

import '../../shared/components/constants.dart';
import 'dart:io' show Platform;



class TripeRegisterCubit extends Cubit<TripeRegisterStates>
{
  TripeRegisterCubit() : super(TripeRegisterInitialState());

  static TripeRegisterCubit get(context) => BlocProvider.of(context);

  late GoogleSignInModel googleSignInModel;
  String platform = Platform.isAndroid ? 'android' :'ios' ;

  void userRegister({
required String name,
required String phone,
required String password,
required String confirmPassword,
required String nationality,
})
{
  emit(TripeRegisterLoadingState());

 DioHelper.postData(
url: UserREGISTER,
data:
{
  'name' :name,
  'phone' :phone,
  'password' :password,
  'nationality_id' :nationality,
  'confirm_password' :confirmPassword,
},
).then((value)
{
  print(value.data);

  registerModel = RegisterModel.fromJson(value.data);
  print(registerModel.message);
  emit(TripeRegisterSuccessState(registerModel));
}).catchError((error)
{
print(error.toString());
emit(TripeRegisterErrorState(error.toString()));
});
}


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(TripeChangePasswordVisibilityStates());
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isConfirmPassword = true;

  void changeConfirmPasswordVisibility()
  {
    isConfirmPassword = !isConfirmPassword;
    suffixIcon = isConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(TripeChangeConfirmPasswordVisibilityStates());
  }


  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );




  void signInWithGoogle()async
  {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAccount? currentUser = googleSignIn.currentUser;
    final bool isSignedIn = await googleSignIn.isSignedIn();


    emit(TripeSignInGoogleLoadingState());

    DioHelper.postData
      (
        url: SOCIALLOGIN,
        data:
        {
          'provider' : 'google',
          'provider_id' : googleSignInAccount?.id,
          'device_token' : deviceToken,
          'type' : platform,
        }
    ).then((value)
    {
      print(value.data);

      googleSignInModel = GoogleSignInModel.fromJson(value.data);

      print(googleSignInModel.data?.user);
      print(googleSignInAccount?.id);
      emit(TripeSignInGoogleSuccessState(googleSignInModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(TripeSignInGoogleErrorState(error.toString()));
    });

  }







}