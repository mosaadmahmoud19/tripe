import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/module/forgot%20_password/check_code.dart';
import 'package:trip_app/module/login/cubit.dart';
import 'package:trip_app/module/login/state.dart';
import 'package:trip_app/shared/components/components.dart';

class SendCodeYourPhoneScreen extends StatelessWidget {


   SendCodeYourPhoneScreen({Key? key}) : super(key: key);


  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripeLoginCubit(),
      child: BlocConsumer<TripeLoginCubit,TripeLoginStates>(
        listener: (context ,state)
        {
          if(state is SendCodeYourPhoneSuccessState)
          {
            if(state.sendCodeYourPhoneModel.result == "success")
            {
              navigateAndFinish(context, CheckCodeScreen());
            }

            else if (state.sendCodeYourPhoneModel.result == "fail")
            {
              showToast(
                text: state.sendCodeYourPhoneModel.message,
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


                      const SizedBox(
                        height: 25.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! TripeLoginLoadingState,
                        builder: (context) => defaultTextButton(
                            textName: 'Next',
                            primaryColor: Colors.white,
                            backgroundColor: Colors.teal,
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                TripeLoginCubit.get(context).sendCodeYourPhone(
                                    phone: phoneController.text,
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
