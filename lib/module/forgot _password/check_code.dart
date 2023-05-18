import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/module/forgot%20_password/reset_password.dart';
import 'package:trip_app/module/login/cubit.dart';
import 'package:trip_app/module/login/state.dart';
import 'package:trip_app/shared/components/components.dart';

class CheckCodeScreen extends StatelessWidget {


  CheckCodeScreen({Key? key}) : super(key: key);


  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripeLoginCubit(),
      child: BlocConsumer<TripeLoginCubit,TripeLoginStates>(
        listener: (context ,state)
        {
          if(state is CheckCodeSuccessState)
          {
            if(state.checkCodeModel.result == "success")
            {
              navigateAndFinish(context, ResetPasswordScreen());
            }

            else if (state.checkCodeModel.result == "fail")
            {
              showToast(
                text: state.checkCodeModel.message,
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


                      defaultFormField(
                          controller: codeController,
                          type: TextInputType.phone,
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



                      SizedBox(
                        height: 13.0,
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! TripeLoginLoadingState,
                        builder: (context) => defaultTextButton(
                            textName: 'Next',
                            primaryColor: Colors.white,
                            backgroundColor: Colors.green.shade300,
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                   TripeLoginCubit.get(context).checkCode(
                                       code: codeController.text,
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
