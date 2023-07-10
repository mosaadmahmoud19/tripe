class GetWishlistPlacesModel {
  String? result;
  String? message;
  Data? data;

  GetWishlistPlacesModel({this.result, this.message, this.data});

  GetWishlistPlacesModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviewsCount;
  bool? favourite;

  Places(
      {this.id,
        this.name,
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
    description = json['description'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    favourite = json['favourite'];
  }


}



// class GetWishlistPlacesModel
// {
//   String? result;
//   String? message;
//   Data? data;
//
//   GetWishlistPlacesModel({this.result, this.message, this.data});
//
//   GetWishlistPlacesModel.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
// }
//
// class Data {
//   List<GetWishlistPlaces>? places = [];
//
//
//   Data({this.places,});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     json['places'].forEach((element) {
//       places?.add(GetWishlistPlaces.fromJson(element));
//     });
//
//   }
// }
//
// class GetWishlistPlaces {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   double? lat;
//   double? lng;
//   double? distance;
//   double? rating;
//   int? reviews_count;
//   int? favourite;
//
//   GetWishlistPlaces(
//       {this.id,
//         this.name,
//         this.description,
//         this.image,
//         this.lat,
//         this.lng,
//         this.distance,
//         this.rating,
//         this.reviews_count,
//         this.favourite});
//
//   GetWishlistPlaces.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     lat = json['lat'];
//     lng = json['lng'];
//     distance = json['distance'].toDouble();
//     rating = json['rating'].toDouble();
//     reviews_count = json['reviews_count'];
//     favourite = json['favourite'];
//   }
// }