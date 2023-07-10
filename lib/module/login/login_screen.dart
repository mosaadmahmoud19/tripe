import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/layout/cubit/triper_screen_latout.dart';
import 'package:trip_app/module/forgot%20_password/send_code_to_your_phone.dart';
import 'package:trip_app/module/login/cubit.dart';
import 'package:trip_app/module/login/state.dart';
import 'package:trip_app/module/register/register_screen.dart';
import 'package:trip_app/shared/components/components.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TripeLoginCubit(),
      child: BlocConsumer<TripeLoginCubit,TripeLoginStates>(
        listener: (context ,state)
        {
          if(state is TripeLoginSuccessState)
          {
            if(state.loginModel.result == "success")
            {
              String? name = state.loginModel.data?.fullName;
              print(name);
              showToast(
                text: state.loginModel.message,
                state: ToastStates.SUCCESS,
              );
              navigateAndFinish(context, HomeScreen());

            }
            else
            {
              if(state.loginModel.result == "fail")
              {
                print(state.loginModel.message);
                showToast(
                  text: state.loginModel.message,
                  state: ToastStates.ERROR,
                );
              }
            }
          }

          // else if(state is TripeSignInGoogleSuccessState)
          //   {
          //     if(state.googleSignInModel.result == "success" )
          //     {
          //       print(state.googleSignInModel.message);
          //       showToast(
          //         text: state.googleSignInModel.message,
          //         state: ToastStates.SUCCESS,
          //       );
          //     }
          //     else
          //     {
          //       print(state.googleSignInModel.message);
          //       if(state.googleSignInModel.result == "fail")
          //       {
          //         print(state.googleSignInModel.message);
          //         showToast(
          //           text: state.googleSignInModel.message,
          //           state: ToastStates.ERROR,
          //         );
          //       }
          //     }
          //   }
        },
        builder: (context,state)
        {
          return  Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(
                        image: AssetImage('assets/images/logo.jpg'),
                        height: 150.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      const Text(
                        "Your phone number",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: " Enter phone ",
                          prefix: Icons.phone,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'please enter your phone number';
                            }
                          }
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      const Text(
                        "Choose password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      defaultFormField(
                        onSubmit: (value)
                        {
                          print(value);
                        },
                        controller: passwordController,
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: TripeLoginCubit.get(context).suffix,
                        isPassword: TripeLoginCubit.get(context).isPassword,
                        suffixPressed: ()
                        {
                          TripeLoginCubit.get(context).changePasswordVisibility();
                        },
                        type: TextInputType.visiblePassword,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                          {
                            return 'password is too short';
                          }

                          return null;
                        },
                      ),
                    Row(
                      children:
                      [
                        Spacer(),
                        TextButton(
                          onPressed:()
                          {
                            navigateTo(context, SendCodeYourPhoneScreen());
                          } ,
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: Colors.teal,
                            ),

                          ),
                        ),
                      ],
                    ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                          condition: state is! TripeLoginLoadingState,
                          builder: (context) => defaultTextButton(
                              textName: 'Login',
                              primaryColor: Colors.white,
                              backgroundColor: Colors.teal,
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  TripeLoginCubit.get(context).userLogin(
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                  );
                                }
                              }
                          ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ?',
                          ),

                          TextButton(
                            onPressed:()
                            {
                              navigateTo(context, RegisterScreen());
                            } ,
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.teal,

                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      Row(
                        children:
                        [
                          Container(
                            color: Colors.grey,
                            width: 133.5,
                            height: 1.0,

                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "or",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            color: Colors.grey,
                            width: 133.5,
                            height: 1.0,

                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      signUpTextButton(
                          textName: 'Sign in with Google',
                          primaryColor: Colors.black,
                          backgroundColor: Colors.white,
                          image: 'assets/images/google.png',
                          function: ()
                          {
                            // TripeLoginCubit.get(context).signInWithGoogle();
                          }
                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      signUpTextButton(
                          textName: 'Sign in with Facebook',
                          primaryColor: Colors.black,
                          backgroundColor: Colors.white,
                          image: 'assets/images/facebook.png',
                          function: ()
                          {
                          }
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

