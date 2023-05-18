
class ConfirmationCodeModel
{
  String? result;
  String? message;
  ConfirmCodeData? data;

  ConfirmationCodeModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] as String?;
    message = json['message'] as String? ;
    data = json['data'] != null ?  ConfirmCodeData.fromJson(json['data']) : null;
  }
}

class ConfirmCodeData
{
  UserConfirmCodeData? user;
  ConfirmCodeData.fromJson(Map<String, dynamic> json)
  {
    user =  json['user'] != null ? UserConfirmCodeData.fromJson(json['user']) : null ;
  }

}


class UserConfirmCodeData
{
  int? userId;
  String? userName;
  String? token;


  UserConfirmCodeData.fromJson(Map<String, dynamic> json)
  {
    userId = json['user_id'];
    userName = json['user_name'];
    token = json['token'];

  }
}