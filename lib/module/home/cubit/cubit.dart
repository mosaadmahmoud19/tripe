import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/home_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);


  late HomeModel homeModel = HomeModel();

  void getAllHome()
  {
    emit(HomeLoadingState());
    DioHelper.postData(
        url: HOME,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);
      if (homeModel != null) {
        emit(HomeSuccessState(homeModel));
        print(homeModel.data?.home?.topRatedPlaces![0].main_image);
      } else {
        emit(HomeErrorState('Error: Failed to parse response data.'));
      }


    }).catchError((error)

    {
      print(error.toString());
      emit(HomeErrorState(error.toString()));

    });
  }



}










