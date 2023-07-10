class GetPlaceReviewModel {
  String? result;
  String? message;
  Data? data;

  GetPlaceReviewModel({this.result, this.message, this.data});

  GetPlaceReviewModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  Reviews? reviews;

  Data({this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    reviews = json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
  }


}

class Reviews {
  List<DataUser>? data;
  int? reviewsCount;

  Reviews({this.data, this.reviewsCount});

  Reviews.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataUser>[];
      json['data'].forEach((v) {
        data!.add(new DataUser.fromJson(v));
      });
    }
    reviewsCount = json['reviews_count'];
  }


}

class DataUser {
  int? id;
  int? rating;
  String? comment;
  String? createdAt;
  User? user;

  DataUser({this.id, this.rating, this.comment, this.createdAt, this.user});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class User {
  int? id;
  String? fullname;
  String? image;

  User({this.id, this.fullname, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    image = json['image'];
  }


}