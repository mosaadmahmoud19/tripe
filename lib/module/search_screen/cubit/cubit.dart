import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/get_pkace_model.dart';
import 'package:trip_app/models/home_model.dart';
import 'package:trip_app/models/search_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/get_place/cubit/states.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/module/search_screen/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);


  late SearchModel searchModel = SearchModel();

  void postSearch(String keyword,) {

    emit(SearchLoadingState());

    DioHelper.postData(
      url: PLACE,
      data:
      {
        'keyword' : keyword,
      },

    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);
      if (searchModel != null) {
        emit(SearchSuccessState(searchModel));
        print(searchModel.data?.places![0].image);
      } else {
        emit(SearchErrorState('Error: Failed to parse response data.'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }




}










