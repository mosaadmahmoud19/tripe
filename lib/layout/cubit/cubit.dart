import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_app/explore/cubit/home_screen.dart';
import 'package:trip_app/explore/cubit/states.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/layout/cubit/triper_screen_latout.dart';
import 'package:trip_app/models/add_places_to_favorite_mode.dart';
import 'package:trip_app/models/add_plans_to_favorite_mode.dart';
import 'package:trip_app/models/add_store_review_model.dart';
import 'package:trip_app/models/confirmation_code_model.dart';
import 'package:trip_app/models/details_plan_model.dart';
import 'package:trip_app/models/get__wishlist_place_model.dart';
import 'package:trip_app/models/get__wishlist_plan_model.dart';
import 'package:trip_app/models/get_pkace_model.dart';
import 'package:trip_app/models/get_place_review.dart';
import 'package:trip_app/models/get_plan_review.dart';
import 'package:trip_app/models/home_model.dart';
import 'package:trip_app/models/plan_details_model.dart';
import 'package:trip_app/models/plan_model.dart';
import 'package:trip_app/models/recommendation.dart';
import 'package:trip_app/models/top_rated_details_model.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/confirmation_code/cubit/states.dart';
import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
import 'package:trip_app/module/get_place/cubit/trip_details_plan_screen.dart';
import 'package:trip_app/module/map_screen.dart';
import 'package:trip_app/module/plan/plan_screen.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/module/search_screen/search_screen.dart';
import 'package:trip_app/shared/components/constants.dart';

import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';

class TriperAppCubit extends Cubit<TriperAppStates>
{
  TriperAppCubit() : super(TriperAppInitialState());

  static TriperAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget> screens=[
    ExploreScreen(),
    PlanScreen(),
    HomePage(),
    GetWishListScreen(),

  ];

  List<String> itemList = ['place' , 'plan'];
  String selectedTypeItem = 'place';

  int? ratingItems = 0;

  // /////////////////////////////

  PageController? pageController;
  void initState() {
    // TODO: implement initState
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {

    });

  }
  void dispose() {
    // TODO: implement dispose
    pageController?.dispose();

  }

  // dropdown city

  String? selectedGovernorate;

  void changeValue(value){
    selectedGovernorate=value;
    emit(ChangeGovernorateState());
  }

  List<String> governorates = [
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Cairo',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Giza',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matrouh',
    'Minya',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez',
  ];

  TimeOfDay? selectedTime;
  TimeOfDay? selectedTimeDay;

  void startTime(picked){
    selectedTime=picked;
    emit(StartTimeState());
  }
  void EndTime(picked){
    selectedTimeDay=picked;
    emit(EndTimeState());
  }

  var isSelected;
  final List<String> options =
  ['Option 1', 'Option 2', 'Option 3','Sports player',
    'football','avatar', 'japan','sport club ','Action films','beautiful trip'];

  void typeSelected(index){
    isSelected=index;
    emit(TypeSelectedState());
  }


 //////

  void changeIndex(int index) {
    currentIndex=index;
    emit(HomeChangeBottomNavBarState());
  }

  bool isBottomSheet = false;

  void changeBottomSheetState({
    required bool isShow,

  }) {
    isBottomSheet = isShow;

    emit(ChangeBottomSheetState());
  }


  void changeItems(String? item)
  {
    selectedTypeItem=item!;
    emit(ChangeItmeState());
  }

  void changeRating(int rating)
  {
    ratingItems = rating;
    emit(ChangeRatingState());
  }

  HomeModel homeModel = HomeModel();

  Map<int?, bool> favorites = {};

  Map<int?, bool> favoritesMostPopular = {};

  Map<int?, bool> favoritesTopRated = {};

  Map<int?, bool> favoritesNearestPlaces = {};

  void getAllHome() {
    emit(HomeAppLoadingState());
    DioHelper.getDataLatLng(
      url: HOME,
      token: token,
      lat: currentPosition?.latitude??31.096509,
      lngg:  currentPosition?.longitude??30.949624,

    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.data?.home?.topRatedPlaces![0].description);


      // plan favorite
      homeModel.data?.home?.plan?.forEach((element) {
        favorites[element.id!] = element.favourite!;
      });

      //favoritesMostPopular

      homeModel.data?.home?.mostPopularPlaces?.forEach((element) {
        favoritesMostPopular[element.id!] = element.favourite!;
      });

      //favoritesTopRated

      homeModel.data?.home?.topRatedPlaces?.forEach((element) {
        favoritesTopRated[element.id!] = element.favourite!;
      });

      //favoritesNearestPlaces

      homeModel.data?.home?.nearestPlaces?.forEach((element) {
        favoritesNearestPlaces[element.id!] = element.favourite!;
      });


      emit(HomeAppSuccessState(homeModel));

    }).catchError((error) {
      print(error.toString());
      emit(HomeAppErrorState(error.toString()));
    });
  }

  late RecommendModel recommendModel = RecommendModel();

  void getRecommendationPlaces() {

    emit(DetailsLoadingState());
    DioHelper.postRecommendation(

        url:'predicted-places',
        token:token,
    )
        .then((value) {
      recommendModel = RecommendModel.fromJson(value.data);
      print('this is recommend :${recommendModel.data}');

      emit(RecommendSuccessState(recommendModel));
    }).catchError((error) {

      print('this is recommend Error ${error.toString()}');
      emit(RecommendErrorState(error.toString()));
      });
    }


  AddPlansToFavoriteModel addPlansToFavoriteModel = AddPlansToFavoriteModel();

  AddPlacesToFavoriteModel addPlacesToFavoriteModel = AddPlacesToFavoriteModel();

 // changeFavorite Plan
  void changeFavorites(int id) {

    favorites[id] = !favorites[id]!;
    emit(ChangeFavoritesPlanLoadingState());

    DioHelper.postData(
      url: 'add-plan-to-favourite/$id',
      token: token,

    ).then((value) {
      addPlansToFavoriteModel = AddPlansToFavoriteModel.fromJson(value.data);
      if (addPlansToFavoriteModel.result == 'fail')
      {
        favorites[id] = !favorites[id]!;

      } else
      {
        getWishListPlan();
      }


      emit(ChangeFavoritesPlanSuccessState(addPlansToFavoriteModel));
    }).catchError((error) {


      emit(ChangeFavoritesPlanErrorState());
    });
  }



  // changeFavorite Most Popular
  void AddPlacefavorite( {
  required int id,
}) {

    favoritesMostPopular[id] = !favoritesMostPopular[id]!;
    emit(ChangeFavoritesPlacesLoadingState());

    DioHelper.postData(
      url: 'add-place-to-favourite/$id',
      token: token,

    ).then((value) {
      addPlacesToFavoriteModel = AddPlacesToFavoriteModel.fromJson(value.data);
      if (addPlacesToFavoriteModel.result == 'fail')
      {
        favoritesMostPopular[id] = !favoritesMostPopular[id]!;

      } else
      {
        getWishListPlaces();
      }
      print(value.data);
      print(addPlacesToFavoriteModel.message);

      emit(ChangeFavoritesPlacesSuccessState(addPlacesToFavoriteModel));
    }).catchError((error) {


      emit(ChangeFavoritesPlacesErrorState(error.toString()));
    });
  }



  // // changeFavorite TopRated
  // void favoriteTopRated(int index) {
  //
  //   favoritesTopRated[homeModel.data?.home?.topRatedPlaces![index].id] = !favoritesTopRated[homeModel.data?.home?.topRatedPlaces![index].id]!;
  //   emit(ChangeFavoritesPlacesLoadingState());
  //
  //   DioHelper.postData(
  //     url: 'add-place-to-favourite/${homeModel.data?.home?.topRatedPlaces![index].id}',
  //     token: token,
  //
  //   ).then((value) {
  //     addPlacesToFavoriteModel = AddPlacesToFavoriteModel.fromJson(value.data);
  //     if (addPlacesToFavoriteModel.result == 'fail')
  //     {
  //       favoritesTopRated[homeModel.data?.home?.topRatedPlaces![index].id] = !favoritesTopRated[homeModel.data?.home?.topRatedPlaces![index].id]!;
  //
  //     } else
  //     {
  //       getWishListPlaces();
  //     }
  //     print(value.data);
  //     print(addPlacesToFavoriteModel.message);
  //
  //     emit(ChangeFavoritesPlacesSuccessState(addPlacesToFavoriteModel));
  //   }).catchError((error) {
  //
  //
  //     emit(ChangeFavoritesPlacesErrorState(error.toString()));
  //   });
  // }
  //
  //
  // // changeFavorite NearestPlaces
  // void favoriteNearestPlaces(int index) {
  //
  //   favoritesNearestPlaces[homeModel.data?.home?.nearestPlaces![index].id] = !favoritesNearestPlaces[homeModel.data?.home?.nearestPlaces![index].id]!;
  //   emit(ChangeFavoritesPlacesLoadingState());
  //
  //   DioHelper.postData(
  //     url: 'add-place-to-favourite/${homeModel.data?.home?.nearestPlaces![index].id}',
  //     token: token,
  //
  //   ).then((value) {
  //     addPlacesToFavoriteModel = AddPlacesToFavoriteModel.fromJson(value.data);
  //     if (addPlacesToFavoriteModel.result == 'fail')
  //     {
  //       favoritesNearestPlaces[homeModel.data?.home?.nearestPlaces![index].id] = !favoritesNearestPlaces[homeModel.data?.home?.nearestPlaces![index].id]!;
  //
  //     } else
  //     {
  //       getWishListPlaces();
  //     }
  //     print(value.data);
  //     print(addPlacesToFavoriteModel.message);
  //
  //     emit(ChangeFavoritesPlacesSuccessState(addPlacesToFavoriteModel));
  //   }).catchError((error) {
  //
  //
  //     emit(ChangeFavoritesPlacesErrorState(error.toString()));
  //   });
  // }



   GetWishlistPlacesModel getWishlistPlacesModel = GetWishlistPlacesModel();

  void getWishListPlaces() {

    emit(GetWishlistPlacesLoadingState());
    DioHelper.getData(
      url: GETWISHLISTPLACES,
      token: token,
    ).then((value)
    {
      getWishlistPlacesModel = GetWishlistPlacesModel.fromJson(value.data);



      emit(GetWishlistPlacesSuccessState(getWishlistPlacesModel));

    }).catchError((error) {
      print(error.toString());
      emit(GetWishlistPlacesErrorState(error.toString()));
    });
  }


   GetWishlistPlanModel getWishlistPlanModel = GetWishlistPlanModel();

  void getWishListPlan() {

    emit(GetWishlistPlansLoadingState());

    DioHelper.getData(
      url: GETWISHLISTPLAN,
      token: token,

    ).then((value) {

      getWishlistPlanModel = GetWishlistPlanModel.fromJson(value.data);

      emit(GetWishlistPlansSuccessState(getWishlistPlanModel));




    }).catchError((error) {
      print(error.toString());
      emit(GetWishlistPlansErrorState(error.toString()));
    });
  }






  StoreReviewModel storeReviewModel = StoreReviewModel();



  void addReview({
  required int? rating,
  required String comment,

    required int idPlace


})
  {
    emit(AddPlanReviewLoadingState());
      DioHelper.postData(
        url: 'reviews',
        token: token,
        data:
        {
          'type' : selectedTypeItem,
          'id' : idPlace ,
          'rating' : rating,
          'comment' : comment,

        }
      ).then((value)
      {

        storeReviewModel = StoreReviewModel.fromJson(value.data);
        print(storeReviewModel.message);
        emit(AddPlanReviewSuccessState(storeReviewModel));

        if(storeReviewModel.result == "success")
        {
          if(selectedTypeItem == 'plan')
          {
            getPlanReviews();
          }
          else
          {
            getPlaceReviews(id: idPlace);
          }

        }


      }).catchError((error)
      {
        print(error.toString());
        emit(AddPlanReviewErrorState(error.toString()));
      });
  }


  GetPlanReviewModel getPlanReviewModel = GetPlanReviewModel();

  void getPlanReviews({
    int? id,
  })
  {
    emit(GetPlanReviewLoadingState());
    DioHelper.getData(
        url: 'get-reviews/plan/$id',
      token: token,
    ).then((value)
    {
      getPlanReviewModel = GetPlanReviewModel.fromJson(value.data);
      emit(GetPlanReviewSuccessState(getPlanReviewModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(GetPlanReviewErrorState(error.toString()));
    });
  }

  GetPlaceReviewModel getPlaceReviewModel = GetPlaceReviewModel();

  void getPlaceReviews({

    int? id,
  })
  {
    emit(GetPlaceReviewLoadingState());

    DioHelper.getData(
      url: 'get-reviews/place/$id',
      token: token,
    ).then((value)
    {
      getPlaceReviewModel = GetPlaceReviewModel.fromJson(value.data);
      emit(GetPlaceReviewSuccessState(getPlaceReviewModel));

    }).catchError((error)
    {
      print(error.toString());
      emit(GetPlaceReviewErrorState(error.toString()));
    });
  }


  /////plan/////
  PlanModel planModel = PlanModel();

  void getPlan() {

    emit(GetPlanLoadingState());

    DioHelper.getData(
      url: 'plans?type=admin&page=2',


    ).then((value)
    {
     print('Paln is Success');

    planModel = PlanModel.fromJson(value.data);


      emit(GetPlanSuccessState(planModel));

    }).catchError((error) {
      print('error from plan user ${error.toString()} ');


      emit(GetPlanErrorState(error.toString()));
    });
  }


  //// plan details model

  PlanDetailsModel planDetailsModel = PlanDetailsModel();

  void getPlanDetailsModel(int? id) {

    emit(GetPlanDetailsLoadingState());

    DioHelper.getData(
      url: 'plan/$id',
      token: token,
    ).then((value)
    {
      print('Plan Details is ${value.data.toString()}');

      planDetailsModel = PlanDetailsModel.fromJson(value.data);


      emit(GetPlanDetailsSuccessState(planDetailsModel));

    }).catchError((error) {
      print(error.toString());
      emit(GetPlanDetailsErrorState(error.toString()));
    });
  }


  // details top rated

  late PlaceData placeData = PlaceData();

  void getAllDetails( int id) {
    emit(DetailsLoadingState());
    DioHelper.getData(
      url: 'place/$id',
      token: token,
    )
        .then((value) {
      placeData = PlaceData.fromJson(value!.data);
      print(placeData.data?.place?.id);
      if (placeData != null) {
        emit(DetailsSuccessState(placeData));
        print(placeData.data?.place?.id);
        print(placeData.data?.plans?[0].title);

      } else {
        emit(DetailsErrorState('Error: Failed to parse response data.'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(DetailsErrorState(error.toString()));
    });
  }


  //////position



  var currentLocation = LatLng(31.096509, 30.949624);
  Position? currentPosition;
  String? currentAddress = "No Location";

  late MapController mapController = MapController();

  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();
  LatLng? searchedLocation;








  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      changeLocation(position);
      _getAddressFromLatLng(currentPosition!);

    }).catchError((e) {
      debugPrint(e);
      print(e + "no");
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
       changePosition( place);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void changeLocation(Position position)
  {
    currentPosition = position;
    currentLocation = LatLng(currentPosition?.latitude ??31.096509 , currentPosition?.longitude ??30.949624);
    print("HI" + currentLocation.toString());

    emit(ChangeLocationStates());
  }

  void changePosition(Placemark place)
  {
    currentAddress =
    '${place.country}, ${place.subAdministrativeArea},';
    print(currentAddress);

    emit(ChangePositionStates());

  }

}










