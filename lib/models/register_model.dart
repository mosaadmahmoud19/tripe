

class RegisterModel
{
  String? result;
  String? message;
  Data? data;

  RegisterModel({this.result, this.message, this.data});


  RegisterModel.fromJson(Map<String ,dynamic> json)
  {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;

  }

}


class Data
{

  int? user_id;
  int? otp;
  String? phone;

  Data({ this.user_id ,this.otp ,this.phone});


  Data.fromJson(Map<String ,dynamic> json)
  {
    user_id = json['user_id'];
    otp = json['otp'];
    phone = json['phone'];

  }
}



