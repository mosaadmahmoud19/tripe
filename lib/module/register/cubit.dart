import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trip_app/models/get_all_nationality_model.dart';
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

  String platform = Platform.isAndroid ? 'android' :'ios' ;

  GetAllNationalityModel getAllNationalityModel = GetAllNationalityModel();


   List<DataNationality>? nationalityList =[] ;


  String? selectedNationalityId = '1';

  void changeItems(String? item)
  {
    selectedNationalityId=item!;
    emit(ChangeNationalityState());
  }
   void getAllNationality()
   {
     emit(TripeGetAllNationalityLoadingState());
     DioHelper.getData(
         url: 'get-all-nationality',
     ).then((value)
     {
       getAllNationalityModel = GetAllNationalityModel.fromJson(value.data);

       nationalityList = getAllNationalityModel.data;

       print(nationalityList);



       emit(TripeRegisterGetAllNationalitySuccessState(getAllNationalityModel));


     }).catchError((error)
     {
       print('error nationality : ${error.toString()}');

       emit(TripeRegisterGetAllNationalityErrorState(error.toString()));

     });

   }

  void userRegister({
required String name,
required String phones,
required String password,
required String confirmPassword,

})
{

  emit(TripeRegisterLoadingState());

 DioHelper.postData(
url: UserREGISTER,
data:
{
  'name' :name,
  'phone' :phones,
  'password' :password,
  'nationality_id' :selectedNationalityId,
  'confirm_password' :confirmPassword,

},
).then((value)
{
  print(value.data);


  registerModel = RegisterModel.fromJson(value.data);
  print(registerModel.data?.phone);

  print('id with get from nationality to rgister is ${selectedNationalityId}');
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

 String? uidGoogle;


  Future<void> signInWithGoogleRegister() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: gAuth?.idToken,
      accessToken: gAuth?.accessToken,
    );

    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    final User? user = userCredential.user;

    if (user != null) {
      uidGoogle = user.uid;
      print('uidGoogle :$uidGoogle');

      signGoogleRegister(user.uid);
      // or
      // for multiple providers: user.providerData.forEach((info) => print('Provider ID: ${info.providerId}'));
    } else {
      print('Failed to sign in with Google');
    }




  }

  GoogleSignInModel googleSignInModel = GoogleSignInModel();

  void signGoogleRegister( String uid)
  {
    emit(TripeSignInGoogleLoadingState());

    DioHelper.postData
      (
        url: SOCIALLOGIN,
        data:
        {
          'provider' : 'google',
          'provider_id' : uid,
          'device_token' : deviceToken,
          'type' : platform,
        }
    ).then((value)
    {
      print(value.data);

      googleSignInModel = GoogleSignInModel.fromJson(value.data);

      print(googleSignInModel.data?.user);

      emit(TripeSignInGoogleSuccessState(googleSignInModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(TripeSignInGoogleErrorState(error.toString()));
    });
  }


//
// void signInWithGoogle()async
//   {
//     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//     final GoogleSignInAccount? currentUser = googleSignIn.currentUser;
//     final bool isSignedIn = await googleSignIn.isSignedIn();
//
//
//     emit(TripeSignInGoogleLoadingState());
//
//     DioHelper.postData
//       (
//         url: SOCIALLOGIN,
//         data:
//         {
//           'provider' : 'google',
//           'provider_id' : googleSignInAccount?.id,
//           'device_token' : deviceToken,
//           'type' : platform,
//         }
//     ).then((value)
//     {
//       print(value.data);
//
//       googleSignInModel = GoogleSignInModel.fromJson(value.data);
//
//       print(googleSignInModel.data?.user);
//       print(googleSignInAccount?.id);
//       emit(TripeSignInGoogleSuccessState(googleSignInModel));
//
//     }).catchError((error)
//     {
//       print(error.toString());
//       emit(TripeSignInGoogleErrorState(error.toString()));
//     });
//
//   }











//   GoogleSignIn googleSignIn = GoogleSignIn(
//     scopes: ['email'],
//   );
//
//   FirebaseAuth auth = FirebaseAuth.instance;

// void signWithGoogle()async
// {
//   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//   print(googleUser);
//   GoogleSignInAuthentication? googleSignInAuthentication =
//       await googleUser?.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     idToken: googleSignInAuthentication?.idToken,
//     accessToken: googleSignInAuthentication?.accessToken,
//   );
//
//    UserCredential userCredential = await auth.signInWithCredential(credential);
//   print(userCredential);
//
//
// }







}