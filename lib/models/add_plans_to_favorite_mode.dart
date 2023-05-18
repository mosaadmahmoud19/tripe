class AddPlansToFavoriteModel
{
  String? result;
  String? message;


  AddPlansToFavoriteModel({this.result, this.message,});

  AddPlansToFavoriteModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }

}