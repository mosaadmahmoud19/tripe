class ResetPasswordModel
{
  String? result;
  String? message;


  ResetPasswordModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] ;
    message = json['message']  ;
  }
}





