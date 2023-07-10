class PlaceData {
  PlaceData({
    this.result,
    this.message,
    this.data,});

  PlaceData.fromJson(Map<String, dynamic>  json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? result;
  String? message;
  Data? data;



}

class Data {
  Data({
    this.place,
    this.plans,});

  Data.fromJson(Map<String, dynamic>  json) {
    place = json['Place'] != null ? Place.fromJson(json['Place']) : null;
    if (json['Plans'] != null) {
      plans = [];
      json['Plans'].forEach((element) {
        plans?.add(Plans.fromJson(element));
      });
    }
  }
  Place? place;
  List<Plans>? plans;



}

class Place {
  Place({
    this.id,
    this.name,
    this.description,
    this.image,
    this.images,
    this.city,
    this.tag,

    this.rating,
    this.reviewsCount,

    this.favourite,});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    city = json['city'];
    tag = json['tag'];

    rating = json['rating'].toString();
    reviewsCount = json['reviews_count'];

    favourite = json['favourite'];
  }
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? images;
  String? city;
  String? tag;

  String? rating;
  int? reviewsCount;

  bool? favourite;


}

class Plans {
  Plans({
    this.id,
    this.title,
    this.description,
    this.images,
    this.favourite,
    this.rating,
    this.reviewsCount,});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
    favourite = json['favourite'];
    rating = json['rating'].toString();
    reviewsCount = json['reviews_count'];
  }
  int? id;
  String? title;
  String? description;
  String? images;
  bool? favourite;
  String? rating;
  int? reviewsCount;



}