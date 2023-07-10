class PlanModel {
  String? result;
  String? message;
  Data? data;

  PlanModel({this.result, this.message, this.data});

  PlanModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}
class Data {
  List<Plans>? plans;

  Data({this.plans});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      for (var item in json['plans']) {
        plans!.add(Plans.fromJson(item));
      }
    }
  }
}

class Plans {
  int? id;
  String? title;
  String? description;
  String? images;
  double? avgRating; // Change the type to 'double' instead of 'double?'
  List<Places>? places;

  Plans({
    this.id,
    this.title,
    this.description,
    this.images,
    this.avgRating,
    this.places,
  });

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
    avgRating = json['avg_rating'].toDouble(); // Convert to double using 'toDouble()'
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(Places.fromJson(v));
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
  double? lat;
  double? lng;
  double? distance;
  String? rating;
  String? reviewsCount;
  bool? favourite;

  Places(
      {this.id,
        this.name,
        this.city,
        this.tag,
        this.description,
        this.image,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviewsCount,
        this.favourite});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    tag = json['tag'];
    description = json['description'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    rating = json['rating'].toString();
    reviewsCount = json['reviews_count'].toString();
    favourite = json['favourite'];
  }

}