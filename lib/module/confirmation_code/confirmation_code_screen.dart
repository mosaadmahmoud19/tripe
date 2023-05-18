import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/register_model.dart';
import 'package:trip_app/module/confirmation_code/cubit/cubit.dart';
import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/login/login_screen.dart';
import 'package:trip_app/shared/components/components.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/local/cache_helper.dart';


class ConfirmationCodeScreen extends StatelessWidget {
   ConfirmationCodeScreen({Key? key}) : super(key: key);

  var verifiedCodeController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ConfirmationCodeCubit(),
      child: BlocConsumer<ConfirmationCodeCubit,ConfirmationCodeStates>(
        listener: (context ,state)
        {
          if(state is ConfirmationCodeSuccessState)
          {
            if(state.confirmationCodeModel.result == "success")
            {
              CacheHelper.saveData(
                key: 'token',
                value: state.confirmationCodeModel.data?.user?.token,
              ).then((value)
              {
                token = state.confirmationCodeModel.data?.user?.token;
                navigateAndFinish(context, LoginScreen());

              });


            }
            else
            {
              if(state.confirmationCodeModel.result == "fail")
              {
                print(state.confirmationCodeModel.message);
                showToast(
                  text: state.confirmationCodeModel.message,
                  state: ToastStates.ERROR,
                );
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





                      SizedBox(
                        height: 30.0,
                      ),


                      defaultFormField(

                          controller: verifiedCodeController,
                          type: TextInputType.number,
                          label: " Enter code ",
                          prefix: Icons.code,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'please enter your code';
                            }
                          }

                      ),


                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ConfirmationCodeLoadingState,
                        builder: (context) => defaultTextButton(
                            textName: 'Send',
                            primaryColor: Colors.white,
                            backgroundColor: Colors.green.shade300,
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                ConfirmationCodeCubit.get(context).sendConfirmationCode(
                                  verifiedCode:verifiedCodeController.text,



                                );

                              }
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
