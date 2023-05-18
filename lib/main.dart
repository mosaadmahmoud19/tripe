import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trip_app/module/explore_screen.dart';
import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
import 'package:trip_app/module/login/login_screen.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/module/register/register_screen.dart';
import 'package:trip_app/module/search_screen/search_screen.dart';
import 'package:trip_app/module/home/home_ternding_screen.dart';
import 'package:trip_app/module/get_place/cubit/trip_details_plan_screen.dart';

import 'dart:io' show Platform;

import 'package:trip_app/shared/bloc_observer.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/local/cache_helper.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';

void main()async
{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

 await CacheHelper.init();
 await Firebase.initializeApp();

  // Initialize local notification plugin
  FlutterLocalNotificationsPlugin localNotification = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('drawable/notification_icon');
  InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await localNotification.initialize(initializationSettings);

// Get device token
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceToken = androidInfo.androidId;
  }
  else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceToken = iosInfo.identifierForVendor;
  }


  print(deviceToken);

  token = CacheHelper.getData(key: 'token');

//   phone = CacheHelper.getData(key: 'phone');
// print(token);
//
// print(phone);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          shadowColor: Colors.amber,
          color: Colors.white,
        )

      ),

      home: RatingAndReviewsScreen(),
    );

  }
}