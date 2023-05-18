import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/module/confirmation_code/confirmation_code_screen.dart';
import 'package:trip_app/module/register/cubit.dart';
import 'package:trip_app/module/register/state.dart';
import 'package:trip_app/shared/components/components.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nationalityController = TextEditingController();
  var formKey = GlobalKey<FormState>();





   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripeRegisterCubit(),
      child: BlocConsumer<TripeRegisterCubit,TripeRegisterStates>(
        listener: (context ,state)
        {
          if(state is TripeRegisterSuccessState)
          {
            if(state.registerModel.result == "success")
            {
              CacheHelper.saveData(
                key: 'phone',
                value: state.registerModel.data?.user?.phone,
              ).then((value)
              {
                phone = state.registerModel.data?.user?.phone;
                navigateAndFinish(context, ConfirmationCodeScreen());

              });



            }
            else
            {
              if(state.registerModel.result == "fail")
              {
                print(state.registerModel.message);
                showToast(
                  text: state.registerModel.message,
                  state: ToastStates.ERROR,
                );
                print(state.registerModel.message);
              }
            }
          }
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
                        image: AssetImage('assets/images/triper.jpeg'),
                        height: 150.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      const Text(
                        "Your name",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: " Enter name ",
                          prefix: Icons.person,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'please enter your name';
                            }
                          }
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "enter your phone ",
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
                          label: " Enter your phone ",
                          prefix: Icons.phone,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'please enter your phone';
                            }
                          }
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "nationality ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      defaultFormField(
                          controller: nationalityController,
                          type: TextInputType.phone,
                          label: " Enter your nationality ",
                          prefix: Icons.person_add,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'please enter your nationality';
                            }
                          }
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "enter your password ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      defaultFormField(
                        onSubmit: (value)
                        {
                          print(value);
                        },
                        controller: passwordController,
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: TripeRegisterCubit.get(context).suffix,
                        isPassword: TripeRegisterCubit.get(context).isPassword,
                        suffixPressed: ()
                        {
                          TripeRegisterCubit.get(context).changePasswordVisibility();
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

                      SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "confirm password ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),

                      defaultFormField(
                        onSubmit: (value)
                        {
                          print(value);
                        },
                        controller: confirmPasswordController,
                        label: 'confirm password',
                        prefix: Icons.lock,
                        suffix: TripeRegisterCubit.get(context).suffixIcon,
                        isPassword: TripeRegisterCubit.get(context).isConfirmPassword,
                        suffixPressed: ()
                        {
                          TripeRegisterCubit.get(context).changeConfirmPasswordVisibility();
                        },
                        type: TextInputType.visiblePassword,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                          {
                            return 'password is not typical';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                          condition: state is! TripeRegisterLoadingState,
                          builder: (context) => defaultTextButton(
                              textName: 'continue',
                              primaryColor: Colors.white,
                              backgroundColor: Colors.green.shade300,
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  TripeRegisterCubit.get(context).userRegister(
                                     name: nameController.text,
                                    phone: phoneController.text,
                                    nationality: nationalityController.text,
                                    password: passwordController.text,
                                    confirmPassword: confirmPasswordController.text,
                                  );
                                }
                              }
                          ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      signUpTextButton(
                          textName: 'Sign up with Google',
                          primaryColor: Colors.black,
                          backgroundColor: Colors.white,
                          image: 'assets/images/google.png',
                          function: ()
                          {
                            TripeRegisterCubit.get(context).signInWithGoogle();
                          }
                      ),

                      SizedBox(
                        height: 30.0,
                      ),
                      signUpTextButton(
                          textName: 'Sign up with Facebook',
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

