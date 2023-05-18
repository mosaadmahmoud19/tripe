import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_app/models/check_code_model.dart';
import 'package:trip_app/models/check_code_model.dart';
import 'package:trip_app/models/goggle_signin_model.dart';
import 'package:trip_app/models/login_model.dart';
import 'package:trip_app/models/reset_password_model.dart';
import 'package:trip_app/models/send_code_to_your_phone_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/login/state.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';

class TripeLoginCubit extends Cubit<TripeLoginStates>
{
  TripeLoginCubit() : super(TripeLoginInitialState());

  static TripeLoginCubit get(context) => BlocProvider.of(context);



  late GoogleSignInModel googleSignInModel;

  String platform = Platform.isAndroid ? 'android' :'ios' ;

  void userLogin({
required String phone,
required String password,
})
{
  emit(TripeLoginLoadingState());

 DioHelper.postData(
url: UserLOGIN,
token: token,
data:
{
  'phone' :phone,
  'password' :password,
  'device_token' :deviceToken,
  'type' :platform,
},
).then((value)
{

  loginModel = LoginModel.fromJson(value.data);
  print(loginModel);
  emit(TripeLoginSuccessState(loginModel));
}).catchError((error)
{
print(error.toString());
emit(TripeLoginErrorState(error.toString()));
});
}


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(TripeChangePasswordVisibilityState());
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isConfirmPassword = true;

  void changeConfirmPasswordVisibility()
  {
    isConfirmPassword = !isConfirmPassword;
    suffixIcon = isConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(TripeChangeConfirmPasswordVisibilityStates());
  }



  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes:
    [
      'email',
    ],
  );
  final FirebaseAuth auth = FirebaseAuth.instance;

  void signInWithGoogle()async
  {



    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    // GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
    //
    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    //
    // UserCredential userCredential = await auth.signInWithCredential(credential);
    // User? user = userCredential.user;
    //
    // DioHelper.postData
    //   (
    //     url: SOCIALLOGIN,
    //   data:
    //   {
    //     'provider' : 'google',
    //     'provider_id' :user?.providerData.isNotEmpty == true ? user?.providerData[0].uid : null,
    //     'device_token' : deviceToken,
    //     'type' : platform,
    //   }
    //  ).then((value)
    // {
    // print(value.data);
    //
    // googleSignInModel = GoogleSignInModel.fromJson(value.data);
    //
    //
    //   print(user?.uid);
    //   emit(TripeSignInGoogleSuccessState(googleSignInModel));
    //
    // }).catchError((error)
    // {
    //   print(error.toString());
    //   emit(TripeSignInGoogleErrorState(error.toString()));
    // });
  }


  late SendCodeYourPhoneModel sendCodeYourPhoneModel;
  void sendCodeYourPhone({
  required String phone,
})
  {
    emit(SendCodeYourPhoneLoadingState());

    DioHelper.postData
      (
      url:SENDCODE,
      data:
      {
        'phone' : phone,
      },
      ).then((value)
    {
      sendCodeYourPhoneModel = SendCodeYourPhoneModel.fromJson(value.data);
      emit(SendCodeYourPhoneSuccessState(sendCodeYourPhoneModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(SendCodeYourPhoneErrorState(error.toString()));

    });


  }


  late CheckCodeModel checkCodeModel;
  void checkCode({
    required String code,
  })
  {

    emit(CheckCodeLoadingState());


    DioHelper.postData
      (
      url:CHECKCODE,
      data:
      {
        'phone' : phone,
        'code' : code,
      },
    ).then((value)
    {

      checkCodeModel = CheckCodeModel.fromJson(value.data);
      emit(CheckCodeSuccessState(checkCodeModel));

    }).catchError((error)
    {

      print(error.toString());
      emit(CheckCodeErrorState(error.toString()));

    });


  }

  late ResetPasswordModel resetPasswordModel;

  void resetPassword({
    required String password,
    required String confirmPassword,
  })
  {
    emit(SendCodeYourPhoneLoadingState());

    DioHelper.postData
      (
      url:RESETPASSWORD,
      data:
      {
        'phone' : phone,
        'code' : '1234',
        'password' : password,
        'confirm_password' : confirmPassword,
      },
    ).then((value)
    {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      emit(ResetPasswordSuccessState(resetPasswordModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(ResetPasswordErrorState(error.toString()));

    });


  }




}