class StoreReviewModel {
  String? result;
  String? message;


  StoreReviewModel({this.result, this.message});

  StoreReviewModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];

  }


}