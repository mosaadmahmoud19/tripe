
class LoginModel
{
   String? result;
   String? message;
   Data? data;

   LoginModel({this.result, this.message, this.data});


   LoginModel.fromJson(Map<String,dynamic> json)
   {
     result = json['result'] ;
     message = json['message']  ;
     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
   }
}


class Data
{
  int? id;
  String? fullName;
  String? phone;
  bool? isActive;
  String? image;
  String? token;

  Data({this.id, this.phone ,this.fullName, this.token,
    this.image, this.isActive,
  });


  Data.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    fullName = json['fullname'];
    phone = json['phone'].toString();
    isActive = json['is_active'];
    image = json['image'];
    token = json['token'];
  }
}

