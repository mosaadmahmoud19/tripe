class GetWishlistPlanModel
{
  String? result;
  String? message;
  Data? data;

  GetWishlistPlanModel({this.result, this.message, this.data});

  GetWishlistPlanModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<GetWishlistPlan>? plans = [];


  Data({this.plans,});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = List<GetWishlistPlan>.from(json['plans'].map((x) => GetWishlistPlan.fromJson(x)));
    } else {
      plans = [];
    }
  }
}

class GetWishlistPlan {
  int? id;
  String? title;
  String? description;
  String? images;
  bool? favourite;
  int? rating;
  int? reviewsCount;


  GetWishlistPlan(
      {this.id,
        this.title,
        this.description,
        this.images,
        this.favourite,
        this.rating,
        this.reviewsCount});

  GetWishlistPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
    favourite = json['favourite'];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
  }
}