class SearchModel
{
  String? result;
  String? message;
  Data? data;

  SearchModel({this.result, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<SearchPlaces>? places = [];


  Data({this.places,});

  Data.fromJson(Map<String, dynamic> json) {
    json['places'].forEach((element) {
      places?.add(SearchPlaces.fromJson(element));
    });

  }
}

class SearchPlaces {
  int? id;
  String? name;
  String? description;
  String? image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  int? favourite;

  SearchPlaces(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviews_count,
        this.favourite});

  SearchPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}