class HomeModel {
  String? result;
  String? message;
  Data? data;

  HomeModel({this.result, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Home? home;

  Data({this.home});

  Data.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
}

class Home {
  List<Plan>? plan = [];
  List<TopRatedPlaces>? topRatedPlaces = [];
  List<MostPopularPlaces>? mostPopularPlaces = [];
  List<NearestPlaces>? nearestPlaces = [];

  Home({this.plan,this.topRatedPlaces, this.mostPopularPlaces, this.nearestPlaces});

  Home.fromJson(Map<String, dynamic> json) {
    json['plan'].forEach((element) {
      plan?.add(Plan.fromJson(element));
    });

    json['top_rated_places'].forEach((element) {
      topRatedPlaces?.add(TopRatedPlaces.fromJson(element));
    });

    json['most_popular_places'].forEach((element) {
      mostPopularPlaces?.add(MostPopularPlaces.fromJson(element));
    });

    json['nearest_places'].forEach((element) {
      nearestPlaces?.add(NearestPlaces.fromJson(element));
    });
  }
}

class Plan {
  int? id;
  String? name;
  String? description;
  String? image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviewsCount;
  int? favourite;
  Plan({
    this.id,
    this.name,
    this.description,
    this.image,
    this.lat,
    this.lng,
    this.distance,
    this.rating,
    this.reviewsCount,
    this.favourite,
  });
  Plan.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name= json['name'];
    description= json['description'];
    image= json['image'];
    lat= json['lat'];
    lng= json['lng'];
    distance= json['distance'].toDouble();
    rating= json['rating'].toDouble();
    reviewsCount= json['reviews_count'];
    favourite= json['favourite'];
  }

}

class TopRatedPlaces {
  int? id;
  String? name;
  String? description;
  String? main_image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  int? favourite;

  TopRatedPlaces(
      {this.id,
        this.name,
        this.description,
        this.main_image,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviews_count,
        this.favourite});

  TopRatedPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    main_image = json['main_image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}

class MostPopularPlaces {
  int? id;
  String? name;
  String? description;
  String? main_image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  int? favourite;

  MostPopularPlaces(
      {this.id,
        this.name,
        this.description,
        this.main_image,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviews_count,
        this.favourite});

  MostPopularPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    main_image = json['main_image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}

class NearestPlaces {
  int? id;
  String? name;
  String? description;
  String? main_image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  int? favourite;

  NearestPlaces({
    this.id,
    this.name,
    this.description,
    this.main_image,
    this.lat,
    this.lng,
    this.distance,
    this.rating,
    this.reviews_count,
    this.favourite,
  });

  NearestPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    main_image = json['main_image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}