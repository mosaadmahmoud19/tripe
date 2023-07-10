
class GoogleSignInModel
{
  String? result;
  String? message;
  Data? data;

  GoogleSignInModel({
    this.result,
    this.message,
    this.data,
});

  GoogleSignInModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] ;
    message = json['message']  ;
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }
}

class Data
{

  UserData? user;

  Data({
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json)
  {
    user =  json['user'] != null ? UserData.fromJson(json['user']) : null ;
  }

}


class UserData
{
  int? id;
  String? fullName;
  String? phone;
  bool? isActive;
  String? image;
  String? token;

  UserData({
    this.id,
    this.fullName,
    this.phone,
    this.isActive,
    this.image,
    this.token,
  });

  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    fullName = json['fullname'];
    phone = json['phone'];
    isActive = json['is_active'];
    image = json['image'];
    token = json['token'];
  }
}