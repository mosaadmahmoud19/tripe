import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/explore/cubit/home_screen.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
import 'package:trip_app/module/forgot%20_password/reset_password.dart';
import 'package:trip_app/module/home/cubit/cubit.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriperAppCubit,TriperAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal,
              toolbarHeight: 65,
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35))),
              centerTitle: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on,color: Colors.red,),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    width:200,
                    height: 30,
                    child: Text(
                        '${TriperAppCubit.get(context).currentAddress}',

                        style: TextStyle(color: Colors.white,fontSize: 18)),
                  )
                ],
              )
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: const Text("Momen@gmail.com"),
                  accountName: const Text("Momen Rizq"),
                  currentAccountPicture: GestureDetector(
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/third_image.jpg"),
                    ),
                    onTap: () => print("This is your current account."),
                  ),
                  otherAccountsPictures: <Widget>[
                    GestureDetector(
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/third_image.jpg"),
                      ),
                      onTap: () {},
                    ),
                  ],
                  decoration: const BoxDecoration(color: Colors.teal),
                ),
                ListTile(
                    title: const Text("home"),
                    leading: const Icon(Icons.home),
                    onTap: ()
                    {
                      navigateTo(context, ExploreScreen());
                    }),
                ListTile(
                    title: const Text("Wishlist"),
                    leading: const Icon(Icons.favorite_border),
                    onTap: ()
                    {
                      navigateTo(context, GetWishListScreen());

                    }),

                ListTile(
                    title: const Text("Setting"),
                    leading: const Icon(Icons.settings),
                    onTap: ()
                    {

                    }),
                ListTile(
                    title: const Text("change password"),
                    leading: const Icon(Icons.lock),
                    onTap: ()
                    {
                      navigateTo(context, ResetPasswordScreen());
                    }),
                ListTile(
                    title: const Text("Setting"),
                    leading: const Icon(Icons.settings),
                    onTap: () {}),
                ListTile(
                    title: const Text("About us"),
                    leading: const Icon(Icons.info),
                    onTap: () {}),
                const Divider(),
                ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.logout),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          //drawer: ,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white10,
            onTap: (index) {
              TriperAppCubit.get(context).changeIndex(index);
            },
            currentIndex: TriperAppCubit.get(context).currentIndex,
            items:  const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 25,
                  ),
                  label:'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.playlist_add_check_circle_outlined,
                    size: 25,
                  ),
                  label: 'Plan'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fmd_good,
                    size: 25,
                  ),
                  label:'Maps'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                  label: 'WishList' ),



            ],
          ),
          body: TriperAppCubit.get(context)
              .screens[TriperAppCubit.get(context).currentIndex],

        );
      },

    );
  }
}