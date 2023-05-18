import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class ConfirmationCodeCubit extends Cubit<ConfirmationCodeStates>
{
  ConfirmationCodeCubit() : super(ConfirmationCodeInitialStates());

  static ConfirmationCodeCubit get(context) => BlocProvider.of(context);


  late ConfirmationCodeModel confirmationCodeModel;


 String platform = Platform.isAndroid ? 'android' :'ios' ;
  void sendConfirmationCode({
  required String verifiedCode,

})


{
  emit(ConfirmationCodeLoadingState());


  DioHelper.postData(
      url: CONFIRMCODE,
      data:
      {
        'verified_code':verifiedCode,
        'phone':registerModel.data?.user?.phone ,
        'device_token':deviceToken,
        'type':platform,
      },
).then((value)
{
  print(value.data);
  confirmationCodeModel = ConfirmationCodeModel.fromJson(value.data);

  emit(ConfirmationCodeSuccessState(confirmationCodeModel));

}).catchError((error)
{
  print(error.toString());
  emit(ConfirmationCodeErrorState(error.toString()));

});

}










}