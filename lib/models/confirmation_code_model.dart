
class ConfirmationCodeModel
{
  String? result;
  String? message;
  ConfirmCodeData? data;

  ConfirmationCodeModel({this.result, this.message, this.data});


  ConfirmationCodeModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] as String?;
    message = json['message'] as String? ;
    data = json['data'] != null ?  ConfirmCodeData.fromJson(json['data']) : null;
  }
}


class ConfirmCodeData
{
  int? userId;
  String? userName;
  String? token;

  ConfirmCodeData({this.userId, this.userName ,this.token});



  ConfirmCodeData.fromJson(Map<String, dynamic> json)
  {
    userId = json['user_id'];
    userName = json['user_name'];
    token = json['token'];

  }
}
