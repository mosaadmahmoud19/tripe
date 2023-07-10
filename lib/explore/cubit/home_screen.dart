import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/models/home_model.dart';
import 'package:trip_app/module/details_places/best_thing.dart';
import 'package:trip_app/module/details_places/most_popular_details.dart';
import 'package:trip_app/module/details_places/nearst_places.dart';
import 'package:trip_app/module/details_places/recommendation_screeen.dart';
import 'package:trip_app/module/details_places/top_rated_details_places.dart';
import 'package:trip_app/module/plan/plan_screen.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/module/search_screen/search_screen.dart';
import 'package:trip_app/shared/components/components.dart';



import 'painter.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<TriperAppCubit,TriperAppStates>(
      listener: (BuildContext context,TriperAppStates state)
      {
        if(state is ChangeFavoritesPlanSuccessState)
        {
          if(state.addPlansToFavoriteModel.result == 'success')
          {
            showToast(
                text: state.addPlansToFavoriteModel.message,
                state: ToastStates.SUCCESS
            );
          }
        }

        else if(state is ChangeFavoritesPlacesSuccessState)
        {
          if(state.addPlacesToFavoriteModel.result == 'success')
          {
            showToast(
                text: state.addPlacesToFavoriteModel.message,
                state: ToastStates.SUCCESS
            );
          }
        }
      },
      builder: (BuildContext context,TriperAppStates state){
        return DefaultTabController(length: 3,
            child:Scaffold(
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 300),
                            child: Text(
                              "Welcome In Tripr",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 350),
                            child: Text(
                              "Start your journey now !",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: size.height * 0.01,
                                  top: size.height * 0.02),
                              child: InkWell(
                                onTap: ()
                                {
                                  navigateTo(context, SearchScreen());
                                },
                                child: Container(
                                    height: 40,
                                    decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(15),),
                                        border: Border.all(color: Colors.grey)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.search,color: Colors.grey,),
                                        SizedBox(width: 5.0,),
                                        Text('Where you want to go ?',style: TextStyle(color: Colors.grey),),
                                      ],
                                    )
                                ),
                              ),
                              // Container(
                              //   style: GoogleFonts.ubuntu(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.w400,
                              //     color: Colors.grey,
                              //   ),
                              //   decoration: InputDecoration(
                              //     contentPadding: const EdgeInsets.symmetric(
                              //         vertical: 0, horizontal: 20),
                              //     filled: true,
                              //     fillColor:
                              //     const Color.fromARGB(255, 240, 240, 240),
                              //     prefixIcon: IconButton(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.search,
                              //         color: Colors.black,
                              //       ),
                              //     ),
                              //     suffixIcon: IconButton(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.filter_alt_outlined,
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //     hintStyle: GoogleFonts.ubuntu(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400,
                              //       color: Colors.grey,
                              //     ),
                              //     hintText: "Discover City",
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.circular(14),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 600),
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              width: size.width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TabBar(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  labelPadding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      right: size.width * 0.05),
                                  //controller: tabController,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicator: const CircleTabBarIndicator(
                                    color: Colors.deepPurpleAccent,
                                    radius: 4,
                                  ),
                                  tabs: const [
                                    Tab(
                                      text: "Most Popular",
                                    ),
                                    Tab(text: "Best thing"),
                                    Tab(text: "Nearst"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 700),
                            child: Container(
                              margin: EdgeInsets.only(top: size.height * 0.01),
                              width: size.width,
                              height: size.height * 0.4,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  // controller: tabController,
                                  children: [
                                    TabMostPopular(),
                                    TabBestThings(),
                                    TabNearestPlaces(),
                                  ]),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 800),
                            child: Padding(
                              padding:
                              EdgeInsets.only(top: size.height * 0.015),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Places For you ",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "see all ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeInUp(
                              delay: const Duration(milliseconds: 900),
                              child: Container(
                                height: 200,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {

                                      final recommendedPlace=TriperAppCubit.get(context).recommendModel.data?.places?.elementAt(index);
                                      final int? id=TriperAppCubit.get(context).recommendModel.data?.places?[index].id;

                                      return GestureDetector(
                                        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecommendedPlace(id:id)));},
                                        child: Stack(children: [
                                          Container(
                                            height: 200,
                                            width: 250,
                                            margin: const EdgeInsets.only(right: 10, left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${recommendedPlace?.image??''}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            top: size.height * 0.2,
                                            child: Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                              width: size.width * 0.53,
                                              height: size.height * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(180, 0, 0, 0),
                                                    Color.fromARGB(128, 29, 29, 29),
                                                    Color.fromARGB(60, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0),
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: size.width * 0.05,
                                            bottom: size.height * 0.035,
                                            child: Text(
                                              "${recommendedPlace?.name??''}",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Positioned(
                                            left: size.width * 0.05,
                                            bottom: 10,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                Text(
                                                  "${recommendedPlace?.city??''}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 13,
                                            right: 17,
                                            child: CircleAvatar(
                                                radius: 18,
                                                backgroundColor: Colors.red,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      size: 19,
                                                      color: Colors.white,
                                                    ))),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 7,
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                '${recommendedPlace?.rating??''}',
                                                style: TextStyle(
                                                    fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      );
                                    },
                                    itemCount: TriperAppCubit.get(context).recommendModel.data?.places?.length??0),
                              ),

                             ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 1000),
                            child: Padding(
                              padding:
                              EdgeInsets.only(top: size.height * 0.015),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Rated",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "see all ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 1100),
                            child: Container(
                              margin: EdgeInsets.only(top: size.height * 0.01),
                              width: size.width,
                              height: size.height * 0.68,
                              child: ListView.builder(
                                  itemCount: TriperAppCubit.get(context).homeModel.data?.home?.topRatedPlaces?.length??0,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final topRated = TriperAppCubit.get(context).homeModel.data?.home?.topRatedPlaces?.elementAt(index);
                                    var id =TriperAppCubit.get(context).homeModel.data?.home?.topRatedPlaces?[index].id;
                                    return topRated !=null ? GestureDetector(
                                      onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopRatedDetails(id: id,)));},
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        width: 220,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(3, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Stack(children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(8.0),
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                    image: NetworkImage("${topRated.image}"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 120,
                                                      child: Text(
                                                        "${topRated.name}",maxLines: 2,
                                                        style:
                                                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${topRated.city}",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 14,
                                            child: IconButton(
                                              onPressed: ()
                                              {
                                                if (context != null) {
                                                  TriperAppCubit.get(context).AddPlacefavorite( id: id!);
                                                }


                                              },
                                              icon: CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: TriperAppCubit.get(context).favoritesMostPopular[topRated.id] != null && TriperAppCubit.get(context).favoritesMostPopular[topRated.id]! ? Colors.red : Colors.grey,
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  size: 14.0,
                                                  color: Colors.white,
                                                ),
                                              ),

                                            ),
                                          ),
                                        ]),
                                      ),
                                    ): SizedBox.shrink();
                                  }),
                            ),
                          ),

                          // FadeInUp(
                          //   delay: const Duration(milliseconds: 1100),
                          //   child: Container(
                          //     margin: EdgeInsets.only(top: size.height * 0.01),
                          //     width: size.width,
                          //     height: size.height * 0.68,
                          //     child: ListView.builder(
                          //         physics: const NeverScrollableScrollPhysics(),
                          //         itemBuilder: (context, index) {
                          //           final topRated = TriperAppCubit.get(context).homeModel.data?.home?.topRatedPlaces?.elementAt(index);
                          //           return topRated !=null ? buildTopRated(topRated , context ,index): Center(child: CircularProgressIndicator());
                          //         },
                          //       itemCount: TriperAppCubit.get(context).homeModel.data?.home?.topRatedPlaces?.length ?? 1,
                          //
                          //     ),
                          //
                          //   ),
                          // ),
                        ]),
                  ),
                ),
              ),
            ));
      },
    );
  }

  }

  // GestureDetector buildTopRated(TopRatedPlaces place, context , index) {
  //
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //       margin: const EdgeInsets.all(8.0),
  //       width: 220,
  //       height: 120,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(15),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 5,
  //             blurRadius: 7,
  //             offset: Offset(3, 3), // changes position of shadow
  //           ),
  //         ],
  //       ),
  //       child: Stack(children: [
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.all(8.0),
  //               width: 100,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 image: DecorationImage(
  //                   image: NetworkImage("${place.image}"),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(left: 10),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   SizedBox(
  //                     width: 120,
  //                     child: Text(
  //                       "${place.name}",maxLines: 2,
  //                       style:
  //                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 5,
  //                   ),
  //                   Text(
  //                     "${place.city}",
  //                     style: TextStyle(
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.w300,
  //                       color: Colors.black.withOpacity(0.5),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         Positioned(
  //           top: 10,
  //           right: 14,
  //           child: IconButton(
  //             onPressed: ()
  //             {
  //               TriperAppCubit.get(context).AddPlacefavorite(index);
  //
  //             },
  //             icon: CircleAvatar(
  //               radius: 15.0,
  //               backgroundColor: TriperAppCubit.get(context).favoritesMostPopular[place.id] != null && TriperAppCubit.get(context).favoritesMostPopular[place.id]! ? Colors.red : Colors.grey,
  //               child: Icon(
  //                 Icons.favorite_border,
  //                 size: 14.0,
  //                 color: Colors.white,
  //               ),
  //             ),
  //
  //           ),
  //         ),
  //       ]),
  //     ),
  //   );
  // }



class TabMostPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<TriperAppCubit,TriperAppStates>(
    listener: (BuildContext context,TriperAppStates state){},
    builder: (BuildContext context,TriperAppStates state){
      return ListView.builder(

        itemCount: TriperAppCubit.get(context).homeModel.data?.home?.mostPopularPlaces?.length??0,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          final popularPlaces = TriperAppCubit.get(context).homeModel.data?.home?.mostPopularPlaces?.elementAt(index);
          var id =TriperAppCubit.get(context).homeModel.data?.home?.mostPopularPlaces?[index].id;
          return popularPlaces != null ? GestureDetector(
            onTap: ()
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestPopularDetails(id:id)));
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${popularPlaces.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: size.height * 0.2,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: size.width * 0.53,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(153, 0, 0, 0),
                          Color.fromARGB(118, 29, 29, 29),
                          Color.fromARGB(54, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: size.height * 0.05,
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      "${popularPlaces.name}",maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: 20,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "${popularPlaces.city}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: ()
                    {
                      TriperAppCubit.get(context).AddPlacefavorite(
                        id: id!,
                      );

                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: TriperAppCubit.get(context).favoritesMostPopular[popularPlaces.id] != null && TriperAppCubit.get(context).favoritesMostPopular[popularPlaces.id]! ? Colors.red : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 7,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '5.0',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ): SizedBox.shrink();
        },
      );
    },
    );
  }
}

class TabBestThings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<TriperAppCubit,TriperAppStates>(
    listener: (BuildContext context,TriperAppStates state){},
    builder: (BuildContext context,TriperAppStates state){
      return ListView.builder(
        itemCount:TriperAppCubit.get(context).homeModel.data?.home?.plan?.length??0,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final planDetails = TriperAppCubit.get(context).homeModel.data?.home?.plan?.elementAt(index);
          var id =TriperAppCubit.get(context).homeModel.data?.home?.plan?[index].id;
          return planDetails !=null ? GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestPlanDetails(id: id,)));
              },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${planDetails.images}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: size.height * 0.2,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: size.width * 0.53,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(153, 0, 0, 0),
                          Color.fromARGB(118, 29, 29, 29),
                          Color.fromARGB(54, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: size.height * 0.05,
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      "${planDetails.title}",maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: 20,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "city",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child:IconButton(
                    onPressed: ()
                    {
                      if(context != null)
                      {
                        TriperAppCubit.get(context).changeFavorites(id!);

                      }


                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: TriperAppCubit.get(context).favorites[planDetails.id] != null && TriperAppCubit.get(context).favorites[planDetails.id]! ? Colors.red : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 7,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '1.0',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ): SizedBox.shrink();
        },
      );
    });
  }
}

class TabNearestPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<TriperAppCubit,TriperAppStates>(
    listener: (BuildContext context,TriperAppStates state){},
    builder: (BuildContext context,TriperAppStates state){
      return ListView.builder(
        itemCount:  TriperAppCubit.get(context).homeModel.data?.home?.nearestPlaces?.length??0,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final nearplace = TriperAppCubit.get(context).homeModel.data?.home?.nearestPlaces?.elementAt(index);
          var id =TriperAppCubit.get(context).homeModel.data?.home?.nearestPlaces?[index].id;
          return nearplace !=null ?GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NearestPlacesDetails(id: id,)));
              },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                          "${nearplace.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: size.height * 0.2,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: size.width * 0.53,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(153, 0, 0, 0),
                          Color.fromARGB(118, 29, 29, 29),
                          Color.fromARGB(54, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: size.height * 0.05,
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      "${nearplace.name}",maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.07,
                  bottom: 20,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "${nearplace.city}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(
                    onPressed: ()
                    {
                      if (context != null) {
                        TriperAppCubit.get(context).AddPlacefavorite( id: id!);
                      }


                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: TriperAppCubit.get(context).favoritesMostPopular[nearplace.id] != null && TriperAppCubit.get(context).favoritesMostPopular[nearplace.id]! ? Colors.red : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 7,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                "5.0",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ): SizedBox.shrink();
        },
      );
    }
    );
  }
}
