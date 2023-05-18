class GetPlaceModel {
  String? result;
  String? message;
  Data? data;

  GetPlaceModel({this.result, this.message, this.data});

  factory GetPlaceModel.fromJson(Map<String, dynamic> json) {
    return GetPlaceModel(
      result: json['result'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? main_image;
  List<Images>? image = [];
  double? lat;
  double? lng;
  double? distance;
  String? rating;
  int? reviews_count;
  int? favourite;

  Data({
    this.id,
    this.name,
    this.description,
    this.main_image,
    this.image,
    this.lat,
    this.lng,
    this.distance,
    this.rating,
    this.reviews_count,
    this.favourite,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<dynamic>? imagesJson = json['image'];
    List<Images>? images = [];
    if (imagesJson != null) {
      imagesJson.forEach((element) {
        images.add(Images.fromJson(element));
      });
    }
    return Data(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      main_image: json['main_image'],
      image: images,
      lat: json['lat'],
      lng: json['lng'],
      distance: json['distance'],
      rating: json['rating'],
      reviews_count: json['reviews_count'],
      favourite: json['favourite'],
    );
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      image: json['image'],
    );
  }
}
