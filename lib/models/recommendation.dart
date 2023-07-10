class RecommendModel {
  String? result;
  String? message;
  Data? data;

  RecommendModel({this.result, this.message, this.data});

  RecommendModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<Places>? places;

  Data({this.places});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
  }

}

class Places {
  int? id;
  String? name;
  String? city;
  String? tag;
  String? description;
  String? image;
  // double? lat;
  // double? lng;
  // double? distance;
  String? rating;
  // int? reviewsCount;
  bool? favourite;

  Places(
      {this.id,
        this.name,
        this.city,
        this.tag,
        this.description,
        this.image,
        // this.lat,
        // this.lng,
        // this.distance,
        this.rating,
        // this.reviewsCount,
        this.favourite});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    tag = json['tag'];
    description = json['description'];
    image = json['image'];
    // lat = json['lat'];
    // lng = json['lng'];
    // distance = json['distance']?.toDouble();  // Parse as double
    rating = json['rating'].toString();  // Parse as double
    // reviewsCount = json['reviews_count']?.toDouble();  // Parse as double
    favourite = json['favourite'];
  }


}