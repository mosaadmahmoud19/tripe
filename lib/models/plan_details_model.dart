class PlanDetailsModel {
  String? result;
  String? message;
  Data? data;

  PlanDetailsModel({this.result, this.message, this.data});

  PlanDetailsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  Plans? plans;

  Data({this.plans});

  Data.fromJson(Map<String, dynamic> json) {
    plans = json['plans'] != null ? new Plans.fromJson(json['plans']) : null;
  }

}

class Plans {
  int? id;
  String? title;
  String? description;
  String? images;

  List<Places>? places;

  Plans(
      {this.id,
        this.title,
        this.description,
        this.images,


        this.places});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];


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

  String? description;
  String? image;


  double? rating;
  int? reviewsCount;
  bool? favourite;

  Places(
      {this.id,
        this.name,
        this.city,

        this.description,
        this.image,



        this.rating,
        this.reviewsCount,
        this.favourite});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];

    description = json['description'];
    image = json['image'];

    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    favourite = json['favourite'];
  }


}