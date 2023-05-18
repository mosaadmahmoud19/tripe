
import 'package:trip_app/models/get__wishlist_plan_model.dart';

abstract class GetWishlistPlansStates{}

class GetWishlistPlansInitialStates extends GetWishlistPlansStates{}

class GetWishlistPlansLoadingState extends GetWishlistPlansStates {}

class GetWishlistPlansSuccessState extends GetWishlistPlansStates
{
  final GetWishlistPlanModel getWishlistPlanModel ;

  GetWishlistPlansSuccessState(this.getWishlistPlanModel);


}

class GetWishlistPlansErrorState extends GetWishlistPlansStates
{
  final String error;

  GetWishlistPlansErrorState(this.error);
}
