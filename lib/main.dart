import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trip_app/introduction_animation/introduction_animation_screen.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/triper_screen_latout.dart';

import 'package:trip_app/module/login/login_screen.dart';
import 'package:trip_app/module/plan/plan_screen.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/module/register/register_screen.dart';


import 'dart:io' show Platform;

import 'package:trip_app/shared/bloc_observer.dart';
import 'package:trip_app/shared/components/constants.dart';
import 'package:trip_app/shared/network/local/cache_helper.dart';
import 'package:trip_app/shared/network/remote/dio_helper.dart';

int? idP;

int getId(int id)
{
  return  idP = id;
}

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



    phone = CacheHelper.getData(key: 'phone').toString();
   token = await CacheHelper.getData(key: 'token') as String?;

   idPlan = await CacheHelper.getData(key: 'idPlan') as int?;

  idTopRatedPlaces = await CacheHelper.getData(key: 'idTopRatedPlaces') as int?;

  print('idPlan is : ${idPlan }');
  print('idPlases is : ${idTopRatedPlaces }');
  print(phone );
  print(token);






  Widget widget;

  if(token == null)
  {
    widget = LoginScreen();

  } else
  {
    widget = HomeScreen();
  }
  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {


  final Widget startWidget;


  MyApp({
     required this.startWidget,
  });



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [

        BlocProvider(
          create: (context) => TriperAppCubit()
            ..getCurrentPosition(context)
            ..getAllHome()
            ..getRecommendationPlaces()
            ..getWishListPlan()
            ..getWishListPlaces()
            ..getPlanReviews(id: idP)
            ..getPlaceReviews()



        ),


      ],
      child: MaterialApp(
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


        home: IntroductionAnimationScreen(),
      ),
    );

  }


}

//StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context,snapshot)
//           {
//             if(snapshot.hasData)
//             {
//               return LoginScreen();
//             }
//             else
//             {
//               return startWidget;
//             }
//           },
//         ),