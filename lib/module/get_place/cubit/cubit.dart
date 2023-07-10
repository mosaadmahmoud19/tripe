// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trip_app/models/confirmation_code_model.dart';
// import 'package:trip_app/models/get_pkace_model.dart';
// import 'package:trip_app/models/home_model.dart';
// import 'dart:io' show Platform;
//
// import 'package:trip_app/module/confirmation_code/cubit/states.dart';
// import 'package:trip_app/module/get_place/cubit/states.dart';
// import 'package:trip_app/module/home/cubit/states.dart';
// import 'package:trip_app/shared/components/constants.dart';
// import 'package:trip_app/shared/network/end_points.dart';
// import 'package:trip_app/shared/network/remote/dio_helper.dart';
//
//
//
// class GetPlaceCubit extends Cubit<GetPlaceStates>
// {
//   GetPlaceCubit() : super(GetPlaceInitialStates());
//
//   static GetPlaceCubit get(context) => BlocProvider.of(context);
//
//
//   late GetPlaceModel getPlaceModel = GetPlaceModel();
//
//   void getPlace() {
//     emit(GetPlaceLoadingState());
//     DioHelper.getData(
//       url: PLACE,
//     ).then((value) {
//       getPlaceModel = GetPlaceModel.fromJson(value.data);
//       if (getPlaceModel != null) {
//         emit(GetPlaceSuccessState(getPlaceModel));
//         print(getPlaceModel.data?.description);
//       } else {
//         emit(GetPlaceErrorState('Error: Failed to parse response data.'));
//       }
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetPlaceErrorState(error.toString()));
//     });
//   }
//
//
//
//
// }
//
//
//
//
//
//
//
//
//
//
