import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.43.123:8000/api/',
        receiveDataWhenStatusError: true,
        followRedirects: true,
        maxRedirects: 5,
        connectTimeout:  const Duration(milliseconds: 800000),

        receiveTimeout: const Duration(milliseconds: 100000),

      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    var lat,
    var lngg,


  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> getDataLatLng({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    var lat,
    var lngg,


  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'lat': "$lat",
      'lng': "$lngg",

    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",



    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,


    );
  }




  static Future<Response> postRecommendation({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'Content-Disposition': 'attachment; filename="users.csv"',
      'Accept':'application/json',



    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,


    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': "Bearer $token",
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': "Bearer $token",
    };

    return dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
