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
    json['plans'].forEach((element) {
      plans?.add(GetWishlistPlan.fromJson(element));
    });

  }
}

class GetWishlistPlan {
  int? id;
  String? title;
  String? description;
  String? images;


  GetWishlistPlan(
      {
        this.id,
        this.title,
        this.description,
        this.images,



        });

  GetWishlistPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
  }
}