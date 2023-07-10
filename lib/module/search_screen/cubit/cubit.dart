import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/models/categories_tag_model.dart';
import 'package:trip_app/models/city_model.dart';
import 'package:trip_app/models/search_filter_model.dart';

import 'package:trip_app/models/search_model.dart';
import 'dart:io' show Platform;

import 'package:trip_app/module/search_screen/cubit/states.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/end_points.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';



class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);


  List<String> Type = ['All Places','Top Rated', 'Most Popular', 'Nearst places'];
  List<String> cateogry = [
    'Restaurant',
    'Hotel',
    'Historical',
    'Entertainment',
    'Museum',
    'Beach',
    'Sport',
    'Cenima'
  ];
  List<String> city = ['Alex', 'Cairo', 'Kafr'];

  List<int> Rate = [1,2,3,4,5];

  List<IconData> typeIcons = [
    Icons.list_outlined ,
    Icons.trending_up,
    Icons.emergency_share,
    Icons.near_me,
  ];
  List<IconData> rateIcons = [
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
    Icons.star,
  ];
  String? selectedType;
  String? selectedCategory;
  String? selectedCity ;
  int? selectedRate;

  //// pagainatuion



  late SearchModel searchModel = SearchModel();

  void postSearch(String keyword,) {

    emit(SearchLoadingState());

    DioHelper.postData(
      url: 'filter-places?1',
      data:
      {
        'keyword' : keyword,
      },

    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);

      emit(SearchSuccessState(searchModel));



    }).catchError((error) {

      print(error.toString());


      emit(SearchErrorState(error.toString()));
    });
  }




   SearchFilterModel searchFilterModel = SearchFilterModel();

  void postFilterSearch(String keyword)
  {

    emit(SearchFilterLoadingState());

    DioHelper.postData(
      url: 'filter-places?page=1',

      data:
      {
        'keyword' : keyword,

      },

    ).then((value)
    {
      searchFilterModel = SearchFilterModel.fromJson(value.data);
      print(searchFilterModel.toString());

      print("success searchfilter $keyword");
      print("success searchfilter $selectedType");
      print("success searchfilter $selectedCitiesId");
      print("success searchfilter $selectedInterestId");
      print("success searchfilter $selectedRate");


      emit(SearchFilterSuccessState(searchFilterModel));
    }).catchError((error) {

      print(keyword);
      print(selectedType);
      print(selectedCitiesId);
      print(selectedInterestId);
      print(selectedRate);

      print(error.toString());
      emit(SearchFilterErrorState(error.toString()));
    });
  }


  // void getSearch() {
  //
  //   emit(SearchLoadingState());
  //
  //   DioHelper.postData(
  //     url: FILTERPLACES,
  //     data:
  //     {
  //       'keyword' : keyword,
  //     },
  //
  //   ).then((value)
  //   {
  //     searchModel = SearchModel.fromJson(value.data);
  //     if (searchModel != null) {
  //       emit(SearchSuccessState(searchModel));
  //       print(searchModel.data?.places![0].image);
  //     } else {
  //       emit(SearchErrorState('Error: Failed to parse response data.'));
  //     }
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(SearchErrorState(error.toString()));
  //   });
  // }


  List<Interests>? interst =[] ;
  String? selectedInterestId ;

  late CategoriesTagModel categoriesTagModel = CategoriesTagModel();

  void getCategoriesTagFilterSearch() {

    emit(GetCategoriesTagLoadingState());

    DioHelper.getData(
         url: 'index-interest',


     ).then((value)
    {
      categoriesTagModel = CategoriesTagModel.fromJson(value.data);

      interst = categoriesTagModel.data?.interests;

      print(interst.toString());
      emit(GetCategoriesTagSuccessState(categoriesTagModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesTagErrorState(error.toString()));
    });
  }


  List<Cities>? citiies =[] ;
  String? selectedCitiesId;


  late CityModel cityModel = CityModel();

  void getCityFilterSearch() {

    emit(GetCitySearchLoadingState());

    DioHelper.getData(
      url: 'cities',
      token: token,

    ).then((value)
    {
      cityModel = CityModel.fromJson(value.data);

      citiies = cityModel.data?.cities;

      print(citiies);
      emit(GetCitySearchSuccessState(cityModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetCitySearchErrorState(error.toString()));
    });
  }



  void changeType(var type)
{
  selectedType = type;
  print(selectedType);
  emit(ChangeTypeStates());
}

void changeCategories(String? category)
{
  selectedInterestId = category;
  print('selectedInterestCategoriesId from states : ${selectedInterestId}');
  emit(ChangeCategoryStates());
}

void changeCity(String? newValue)
{
  selectedCitiesId = newValue;
  print(selectedInterestId);
  emit(ChangeCityStates());
}

void changeRated(var rate)
{
  selectedRate = rate;
  print(selectedRate);
  emit(ChangeRateStates());
}




}










