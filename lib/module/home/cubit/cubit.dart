import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/get__wishlist_place_model.dart';
import 'package:trip_app/models/home_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/module/trip_screen_source.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



// class HomeCubit extends Cubit<HomeStates>
// {
//   HomeCubit() : super(HomeInitialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//   int currentIndex = 0;
//   List<Widget> screens=[
//     HomeScreen(),
//     GetWishListScreen(),
//
//
//   ];
//
//   void changeIndex(int index) {
//     currentIndex=index;
//     emit(HomeChangeBottomNavBarState());
//   }
//
//   late HomeModel homeModel = HomeModel();
//
//   void getAllHome()
//   {
//     emit(HomeLoadingState());
//     DioHelper.getData(
//         url: HOME,
//     ).then((value)
//     {
//       homeModel = HomeModel.fromJson(value.data);
//       if (homeModel != null) {
//         emit(HomeSuccessState(homeModel));
//         print(homeModel.data?.home?.topRatedPlaces![0].image);
//       } else {
//         emit(HomeErrorState('Error: Failed to parse response data.'));
//       }
//
//
//     }).catchError((error)
//
//     {
//       print(error.toString());
//       emit(HomeErrorState(error.toString()));
//
//     });
//   }
//
//
//
// }










