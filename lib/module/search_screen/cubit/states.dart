

import 'package:trip_app/models/search_model.dart';

abstract class SearchStates{}

class SearchInitialStates extends SearchStates{}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates
{
  final SearchModel searchModel ;

  SearchSuccessState(this.searchModel);


}

class SearchErrorState extends SearchStates
{
  final String error;

  SearchErrorState(this.error);
}
