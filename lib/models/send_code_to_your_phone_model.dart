class SendCodeYourPhoneModel
{
  String? result;
  String? message;


  SendCodeYourPhoneModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] ;
    message = json['message']  ;
  }
}





