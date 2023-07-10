class CategoriesTagModel {
  String? result;
  String? message;
  Data? data;

  CategoriesTagModel({this.result, this.message, this.data});

  CategoriesTagModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<Interests>? interests;

  Data({this.interests});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Interests'] != null) {
      interests = <Interests>[];
      json['Interests'].forEach((v) {
        interests!.add(new Interests.fromJson(v));
      });
    }
  }


}

class Interests {
  int? id;
  String? name;
  String? image;

  Interests({this.id, this.name, this.image});

  Interests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }


}