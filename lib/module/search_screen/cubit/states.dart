

import 'package:trip_app/models/categories_tag_model.dart';
import 'package:trip_app/models/city_model.dart';
import 'package:trip_app/models/search_filter_model.dart';
import 'package:trip_app/models/search_model.dart';

abstract class SearchStates{}

class SearchInitialStates extends SearchStates{}

class SearchLoadingState extends SearchStates {}

class SearchFaleseLoadingState extends SearchStates {}


class SearchFirstLoadingState extends SearchStates {}

class SearchFetchLoadingState extends SearchStates {}

class SearchIsLoadingState extends SearchStates {}

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


class SearchFilterLoadingState extends SearchStates {}

class SearchFilterSuccessState extends SearchStates
{
  final SearchFilterModel searchFilterModel ;

  SearchFilterSuccessState(this.searchFilterModel);


}

class SearchFilterErrorState extends SearchStates
{
  final String error;

  SearchFilterErrorState(this.error);
}


class GetCategoriesTagLoadingState extends SearchStates {}

class GetCategoriesTagSuccessState extends SearchStates
{
  final CategoriesTagModel categoriesTagModel ;

  GetCategoriesTagSuccessState(this.categoriesTagModel);


}

class GetCategoriesTagErrorState extends SearchStates
{
  final String error;

  GetCategoriesTagErrorState(this.error);
}


class GetCitySearchLoadingState extends SearchStates {}

class GetCitySearchSuccessState extends SearchStates
{
  final CityModel cityModel ;

  GetCitySearchSuccessState(this.cityModel);


}

class GetCitySearchErrorState extends SearchStates
{
  final String error;

  GetCitySearchErrorState(this.error);
}


// get search

class GetSearchLoadingState extends SearchStates {}

class GetSearchSuccessState extends SearchStates
{
  // final SearchModel searchModel ;
  //
  // SearchSuccessState(this.searchModel);


}

class GetSearchErrorState extends SearchStates
{
  final String error;

  GetSearchErrorState(this.error);
}


//// filter

class ChangeTypeStates extends SearchStates {}

class ChangeCategoryStates extends SearchStates {}

class ChangeCityStates extends SearchStates {}

class ChangeRateStates extends SearchStates {}

class FilterSearchLoadingState extends SearchStates {}


class FilterSearchSuccessState extends SearchStates
{
  final SearchFilterModel searchFilterModel ;

  FilterSearchSuccessState(this.searchFilterModel);


}

class FilterSearchErrorState extends SearchStates
{
  final String error;

  FilterSearchErrorState(this.error);
}

