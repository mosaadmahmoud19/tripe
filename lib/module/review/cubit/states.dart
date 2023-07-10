import 'package:trip_app/models/add_store_review_model.dart';
import 'package:trip_app/models/get_place_review.dart';
import 'package:trip_app/models/get_plan_review.dart';

abstract class ReviewStates {}

class ReviewInitialState extends ReviewStates{}

class ChangeItmeState extends ReviewStates{}

class ChangeRatingState extends ReviewStates{}



// add plan review

class AddPlanReviewLoadingState extends ReviewStates {}

class AddPlanReviewSuccessState extends ReviewStates
{
  final StoreReviewModel storeReviewModel ;

  AddPlanReviewSuccessState(this.storeReviewModel);

}

class AddPlanReviewErrorState extends ReviewStates
{
  final String error;

  AddPlanReviewErrorState(this.error);
}

// add place review

class AddPlaceReviewLoadingState extends ReviewStates {}

class AddPlaceReviewSuccessState extends ReviewStates {}

class AddPlaceReviewErrorState extends ReviewStates
{
  final String error;

  AddPlaceReviewErrorState(this.error);
}


// get plan review

class GetPlanReviewLoadingState extends ReviewStates {}

class GetPlanReviewSuccessState extends ReviewStates
{
  final GetPlanReviewModel getPlanReviewModel;

  GetPlanReviewSuccessState(this.getPlanReviewModel);
}

class GetPlanReviewErrorState extends ReviewStates
{
  final String error;

  GetPlanReviewErrorState(this.error);
}


// get place review

class GetPlaceReviewLoadingState extends ReviewStates {}

class GetPlaceReviewSuccessState extends ReviewStates
{
  final GetPlaceReviewModel getPlaceReviewModel;

  GetPlaceReviewSuccessState(this.getPlaceReviewModel);
}


class GetPlaceReviewErrorState extends ReviewStates
{
  final String error;

  GetPlaceReviewErrorState(this.error);
}