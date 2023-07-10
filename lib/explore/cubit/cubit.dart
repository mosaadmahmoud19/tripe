// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trip_app/explore/cubit/states.dart';
// import 'package:trip_app/layout/cubit/triper_screen_latout.dart';
// import 'package:trip_app/models/home_model.dart';
// import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
// import 'package:trip_app/shared/network/end_points.dart';
// import 'package:trip_app/shared/network/remote/dio_helper.dart';
//
// class HomeCubit extends Cubit<HomeStates>
// {
//   HomeCubit() : super(HomeInitialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//
//
//
//   late HomeModel homeModel = HomeModel();
//
//   void getAllHome()
//   {
//     emit(HomeLoadingState());
//     DioHelper.getData(
//       url: HOME,
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
//
//
//
//
// }
