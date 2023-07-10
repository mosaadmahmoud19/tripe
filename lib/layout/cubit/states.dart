import 'package:trip_app/models/add_places_to_favorite_mode.dart';
import 'package:trip_app/models/add_plans_to_favorite_mode.dart';
import 'package:trip_app/models/add_store_review_model.dart';
import 'package:trip_app/models/add_store_review_model.dart';
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


abstract class TriperAppStates {}

class TriperAppInitialState extends TriperAppStates{}

class HomeChangeBottomNavBarState extends TriperAppStates{}

class ChangeBottomSheetState extends TriperAppStates{}

class ChangeItmeState extends TriperAppStates{}

class ChangeRatingState extends TriperAppStates{}

class ChangeGovernorateState extends TriperAppStates{}

class StartTimeState extends TriperAppStates{}

class EndTimeState extends TriperAppStates{}

class TypeSelectedState extends TriperAppStates{}

// Home

class HomeAppInitialState extends TriperAppStates{}


class HomeAppLoadingState extends TriperAppStates {}

class HomeAppSuccessState extends TriperAppStates {
  final HomeModel homeModel ;
  HomeAppSuccessState(this.homeModel);
}

class HomeAppErrorState extends TriperAppStates {
  final String error;

  HomeAppErrorState(this.error);
}

// get wish list places

class GetWishlistPlacesInitialStates extends TriperAppStates{}

class GetWishlistPlacesLoadingState extends TriperAppStates {}

class GetWishlistPlacesSuccessState extends TriperAppStates
{
  final GetWishlistPlacesModel getWishlistPlacesModel ;

  GetWishlistPlacesSuccessState(this.getWishlistPlacesModel);


}

class GetWishlistPlacesErrorState extends TriperAppStates
{
  final String error;

  GetWishlistPlacesErrorState(this.error);
}

// // get wish list plan

class GetWishlistPlansInitialStates extends TriperAppStates{}

class GetWishlistPlansLoadingState extends TriperAppStates {}

class GetWishlistPlansSuccessState extends TriperAppStates
{
  final GetWishlistPlanModel getWishlistPlanModel ;

  GetWishlistPlansSuccessState(this.getWishlistPlanModel);


}

class GetWishlistPlansErrorState extends TriperAppStates
{
  final String error;

  GetWishlistPlansErrorState(this.error);
}

// get details plan


class GetDetailsPlanLoadingState extends TriperAppStates {}

class GetDetailsPlanSuccessState extends TriperAppStates
{
  final PlanDetailsModel planDetailsModel ;

  GetDetailsPlanSuccessState(this.planDetailsModel);


}

class GetDetailsPlanErrorState extends TriperAppStates
{
  final String error;

  GetDetailsPlanErrorState(this.error);
}

// favorite plan

class ChangeFavoritesPlanLoadingState extends TriperAppStates {}

class ChangeFavoritesPlanSuccessState extends TriperAppStates
{
  final AddPlansToFavoriteModel addPlansToFavoriteModel;

  ChangeFavoritesPlanSuccessState(this.addPlansToFavoriteModel);
}

class ChangeFavoritesPlanErrorState extends TriperAppStates {}


// favorite places

class ChangeFavoritesPlacesLoadingState extends TriperAppStates {}

class ChangeFavoritesPlacesSuccessState extends TriperAppStates
{
  final AddPlacesToFavoriteModel addPlacesToFavoriteModel;

  ChangeFavoritesPlacesSuccessState(this.addPlacesToFavoriteModel);
}

class ChangeFavoritesPlacesErrorState extends TriperAppStates
{
  final String error;

  ChangeFavoritesPlacesErrorState(this.error);
}

// add plan review

class AddPlanReviewLoadingState extends TriperAppStates {}

class AddPlanReviewSuccessState extends TriperAppStates
{
  final StoreReviewModel storeReviewModel ;

  AddPlanReviewSuccessState(this.storeReviewModel);

}

class AddPlanReviewErrorState extends TriperAppStates
{
  final String error;

  AddPlanReviewErrorState(this.error);
}

// add place review

class AddPlaceReviewLoadingState extends TriperAppStates {}

class AddPlaceReviewSuccessState extends TriperAppStates {}

class AddPlaceReviewErrorState extends TriperAppStates
{
  final String error;

  AddPlaceReviewErrorState(this.error);
}


// get plan review

class GetPlanReviewLoadingState extends TriperAppStates {}

class GetPlanReviewSuccessState extends TriperAppStates
{
  final GetPlanReviewModel getPlanReviewModel;

  GetPlanReviewSuccessState(this.getPlanReviewModel);
}

class GetPlanReviewErrorState extends TriperAppStates
{
  final String error;

  GetPlanReviewErrorState(this.error);
}


// get place review

class GetPlaceReviewLoadingState extends TriperAppStates {}

class GetPlaceReviewSuccessState extends TriperAppStates
{
  final GetPlaceReviewModel getPlaceReviewModel;

  GetPlaceReviewSuccessState(this.getPlaceReviewModel);
}

class GetPlaceReviewErrorState extends TriperAppStates
{
  final String error;

  GetPlaceReviewErrorState(this.error);
}

/// get plan for use


class GetPlanLoadingState extends TriperAppStates {}

class GetPlanSuccessState extends TriperAppStates
{
  final PlanModel planModel ;

  GetPlanSuccessState(this.planModel);


}

class GetPlanErrorState extends TriperAppStates
{
  final String error;

  GetPlanErrorState(this.error);
}

//////////////////////////////


/// get Plan Details for use


class GetPlanDetailsLoadingState extends TriperAppStates {}

class GetPlanDetailsSuccessState extends TriperAppStates
{
  final PlanDetailsModel planDetailsModel ;

  GetPlanDetailsSuccessState(this.planDetailsModel);


}

class GetPlanDetailsErrorState extends TriperAppStates
{
  final String error;

  GetPlanDetailsErrorState(this.error);
}

//////////////////////////////

// top rated

class DetailsLoadingState extends TriperAppStates {}

class DetailsSuccessState extends TriperAppStates
{

  final PlaceData detailsModel ;
  DetailsSuccessState(this.detailsModel);
}
class DetailsErrorState extends TriperAppStates
{
  final String error;

  DetailsErrorState(this.error);
}

class ChangeLocationStates extends TriperAppStates{}

class ChangePositionStates extends TriperAppStates{}



class RecommendLoadingsState extends TriperAppStates {}

class RecommendSuccessState extends TriperAppStates {
  final RecommendModel recommendModel ;
  RecommendSuccessState(this.recommendModel);
}

class RecommendErrorState extends TriperAppStates {
  final String error;

  RecommendErrorState(this.error);
}