import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/module/login/cubit.dart';
import 'package:trip_app/module/login/state.dart';
import 'package:trip_app/shared/components/components.dart';

class ResetPasswordScreen extends StatelessWidget {


  ResetPasswordScreen({Key? key}) : super(key: key);


  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripeLoginCubit(),
      child: BlocConsumer<TripeLoginCubit,TripeLoginStates>(
        listener: (context ,state)
        {
          if(state is ResetPasswordSuccessState)
          {
            if(state.resetPasswordModel.result == "success")
            {
              showToast(
              text: state.resetPasswordModel.message,
              state: ToastStates.SUCCESS,
            );

            }

            else if (state.resetPasswordModel.result == "fail")
            {
              showToast(
                text: state.resetPasswordModel.message,
                state: ToastStates.ERROR,
              );
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
                      const Text(
                        " password ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
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
                        suffix: TripeLoginCubit.get(context).suffixIcon,
                        isPassword: TripeLoginCubit.get(context).isConfirmPassword,
                        suffixPressed: ()
                        {
                          TripeLoginCubit.get(context).changeConfirmPasswordVisibility();
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
                        condition: state is! TripeLoginLoadingState,
                        builder: (context) => defaultTextButton(
                            textName: 'Reset password',
                            primaryColor: Colors.white,
                            backgroundColor: Colors.green.shade300,
                            function: ()
                            {
                              TripeLoginCubit.get(context).resetPassword(
                                  password: passwordController.text,
                                  confirmPassword: confirmPasswordController.text,
                              );

                            }
                        ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
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
