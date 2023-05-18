class CheckCodeModel
{
  String? result;
  String? message;
  bool? isActive;


  CheckCodeModel.fromJson(Map<String,dynamic> json)
  {
    result = json['result'] ;
    message = json['message'];
    isActive = json['is_active'];
  }
}





