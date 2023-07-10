class GetAllNationalityModel {
  String? result;
  String? message;
  List<DataNationality>? data;

  GetAllNationalityModel({this.result, this.message, this.data});

  GetAllNationalityModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataNationality>[];
      json['data'].forEach((v) {
        data!.add(new DataNationality.fromJson(v));
      });
    }
  }





}

class DataNationality {
  int? id;
  String? name;

  DataNationality({this.id, this.name});

  DataNationality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }



}