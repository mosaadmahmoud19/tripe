import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/get__wishlist_plan_model.dart';
import 'package:trip_app/models/get_pkace_model.dart';
import 'package:trip_app/models/home_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/favorite/plans/cubit/states.dart';
import 'package:trip_app/module/get_place/cubit/states.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class GetWishlistPlansCubit extends Cubit<GetWishlistPlansStates>
{
  GetWishlistPlansCubit() : super(GetWishlistPlansInitialStates());

  static GetWishlistPlansCubit get(context) => BlocProvider.of(context);


  late GetWishlistPlanModel getWishlistPlanModel = GetWishlistPlanModel();

  void getWishListPlan() {
    emit(GetWishlistPlansLoadingState());
    DioHelper.getData(
      url: GETWISHLISTPLAN,
    ).then((value) {
      getWishlistPlanModel = GetWishlistPlanModel.fromJson(value.data);
      if (getWishlistPlanModel != null) {
        emit(GetWishlistPlansSuccessState(getWishlistPlanModel));
        print(getWishlistPlanModel.data?.plans![0].description);
      } else {
        emit(GetWishlistPlansErrorState('Error: Failed to parse response data.'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetWishlistPlansErrorState(error.toString()));
    });
  }




}










