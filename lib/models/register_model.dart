

class RegisterModel
{
  String? result;
  String? message;
  Data? data;

  RegisterModel.fromJson(Map<String ,dynamic> json)
  {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;

  }

}


class Data
{
  UserData? user;
  Data.fromJson(Map<String ,dynamic> json)
  {

    user = json['user'] != null ?  UserData.fromJson(json['user']) : null;

  }
}

class UserData
{
  int? user_id;
  int? otp;
  String? phone;

  UserData.fromJson(Map<String ,dynamic> json)
  {
    user_id = json['user_id'];
    otp = json['otp'];
    phone = json['phone'] ;

  }
}