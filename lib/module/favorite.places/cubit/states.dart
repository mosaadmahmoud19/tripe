
import 'package:trip_app/models/get__wishlist_place_model.dart';

abstract class GetWishlistPlacesStates{}

class GetWishlistPlacesInitialStates extends GetWishlistPlacesStates{}

class GetWishlistPlacesLoadingState extends GetWishlistPlacesStates {}

class GetWishlistPlacesSuccessState extends GetWishlistPlacesStates
{
  final GetWishlistPlacesModel getWishlistPlacesModel ;

  GetWishlistPlacesSuccessState(this.getWishlistPlacesModel);


}

class GetWishlistPlacesErrorState extends GetWishlistPlacesStates
{
  final String error;

  GetWishlistPlacesErrorState(this.error);
}
