import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/get__wishlist_place_model.dart';
import 'package:trip_app/models/get__wishlist_plan_model.dart';
import 'package:trip_app/models/get_pkace_model.dart';
import 'package:trip_app/models/home_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/favorite.places/cubit/states.dart';
import 'package:trip_app/module/favorite/plans/cubit/states.dart';
import 'package:trip_app/module/get_place/cubit/states.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class GetWishlistPlacesCubit extends Cubit<GetWishlistPlacesStates>
{
  GetWishlistPlacesCubit() : super(GetWishlistPlacesInitialStates());

  static GetWishlistPlacesCubit get(context) => BlocProvider.of(context);


  late GetWishlistPlacesModel getWishlistPlacesModel = GetWishlistPlacesModel();

  void getWishListPlan() {
    emit(GetWishlistPlacesLoadingState());
    DioHelper.getData(
      url: GETWISHLISTPLAN,
    ).then((value) {
      getWishlistPlacesModel = GetWishlistPlacesModel.fromJson(value.data);
      if (getWishlistPlacesModel != null) {
        emit(GetWishlistPlacesSuccessState(getWishlistPlacesModel));
        print(getWishlistPlacesModel.data?.places![0].description);
      } else {
        emit(GetWishlistPlacesErrorState('Error: Failed to parse response data.'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetWishlistPlacesErrorState(error.toString()));
    });
  }




}










