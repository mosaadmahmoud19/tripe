class AddPlacesToFavoriteModel
{
  String? result;
  String? message;


  AddPlacesToFavoriteModel({this.result, this.message,});

  AddPlacesToFavoriteModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }

}