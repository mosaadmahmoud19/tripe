import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/explore/cubit/cubit.dart';
import 'package:trip_app/explore/cubit/states.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/models/get__wishlist_place_model.dart';
import 'package:trip_app/models/get__wishlist_plan_model.dart';
import 'package:trip_app/module/home/cubit/cubit.dart';
import 'package:trip_app/module/home/cubit/states.dart';
import 'package:trip_app/shared/components/components.dart';

class GetWishListScreen extends StatelessWidget {
  const GetWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TriperAppCubit,TriperAppStates>(
      listener: (context,state)
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
      builder: (context,state)
      {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children:
              [
                Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TabBar(
                    indicator:  BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs:
                    const [
                      Tab(
                        text: 'Places',

                      ),
                      Tab(
                        text: 'Plans',

                      ),
                    ],

                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: TabBarView(
                    children:
                    [
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index)
                        {
                          final places = TriperAppCubit.get(context).getWishlistPlacesModel.data?.places?.elementAt(index);
                          return places != null ? buildPlaces(places , context , index) : SizedBox.shrink();
                        } ,
                        itemCount: TriperAppCubit.get(context).getWishlistPlacesModel.data?.places?.length,


                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index)
                        {
                          final plans = TriperAppCubit.get(context).getWishlistPlanModel.data?.plans?.elementAt(index);
                          return plans != null ? buildPlans(plans , context , index) : SizedBox.shrink();
                        },
                        itemCount: TriperAppCubit.get(context).getWishlistPlanModel.data?.plans?.length,

                      ),
                    ],
                  ),
                ),
                // Card(
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   elevation: 5.0,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //   child: Column(
                //     children:
                //     [
                //       Stack(
                //         children:
                //         [
                //           Container(
                //             height: 145,
                //             width: 312,
                //             decoration:  BoxDecoration(
                //               image: DecorationImage(
                //                 image: NetworkImage(
                //                     'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
                //                 ),
                //                 fit: BoxFit.cover,
                //               ),
                //               borderRadius:  BorderRadiusDirectional.only(
                //                 topStart: Radius.circular(20.0),
                //                 topEnd: Radius.circular(20.0),
                //               ),
                //
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(15.0),
                //             child: Container(
                //               height: 30.0,
                //               width: 70.0,
                //               decoration:  BoxDecoration(
                //                 borderRadius: BorderRadiusDirectional.horizontal(
                //                   end: Radius.circular(20.0),
                //                   start:  Radius.circular(20.0),
                //                 ),
                //                 color: Colors.white,
                //               ),
                //               child:  Center(
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Row(
                //
                //                     crossAxisAlignment: CrossAxisAlignment.end,
                //                     children:
                //                     [
                //                       RatingBar.builder(
                //                         itemSize:16.0,
                //                         initialRating:2,
                //                         minRating: 1.0,
                //                         direction: Axis.horizontal,
                //                         allowHalfRating: true,
                //                         itemCount: 1,
                //                         itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                //                         itemBuilder: (context, _) => const Icon(
                //                           Icons.star,
                //                           color: Colors.orange,
                //                         ),
                //                         onRatingUpdate: (rating) {
                //                           print(rating);
                //                         },
                //                         glowColor: Colors.blue,
                //                       ),
                //                       SizedBox(
                //                         width: 3.0,
                //                       ),
                //                       Text(
                //                         '4.2',
                //
                //                         maxLines: 1,
                //                         overflow: TextOverflow.ellipsis,
                //
                //                         style: TextStyle(
                //                           fontSize: 12.0,
                //                           fontWeight: FontWeight.bold,
                //
                //                           color: Colors.grey,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Positioned(
                //             top: 15.0,
                //             right: 15.0,
                //             child: CircleAvatar(
                //               backgroundColor: Colors.white,
                //               radius: 15.0,
                //               child: IconButton(
                //                 onPressed: ()
                //                 {
                //
                //                 },
                //                 icon: const Icon(
                //                   Icons.favorite,
                //                   size: 15.0,
                //                   color: Colors.red,
                //                 ),
                //               ),
                //             ),
                //           ),
                //
                //
                //         ],
                //       ),
                //       SizedBox(
                //         height: 10.0,
                //       ),
                //       Align(
                //         alignment: AlignmentDirectional.topStart,
                //         child: Padding(
                //           padding:  EdgeInsetsDirectional.only(
                //             start: 18.0
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //
                //             children:
                //             [
                //               Text(
                //                 'Giza',
                //                 maxLines: 1,
                //                 overflow: TextOverflow.ellipsis,
                //
                //                 style: TextStyle(
                //                   fontSize: 20.0,
                //                   fontWeight: FontWeight.bold,
                //
                //                   color: Colors.black,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 8.0,
                //               ),
                //               Text(
                //                 'Enjoy your trip',
                //
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //
                //                 style: TextStyle(
                //                   fontSize: 18.0,
                //                   fontWeight: FontWeight.normal,
                //                   color: Colors.grey,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 8.0,
                //               ),
                //               Row(
                //                 children:
                //                 [
                //                   Icon(
                //                     Icons.location_on,
                //                     size: 15.0,
                //                     color: Colors.orange,
                //                   ),
                //                   SizedBox(
                //                     width: 8.0,
                //                   ),
                //                   Text(
                //                     '150 m',
                //                     style: TextStyle(
                //                       fontSize: 15.0,
                //                       fontWeight: FontWeight.normal,
                //                       color: Colors.grey,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 10.0,
                //               ),
                //
                //             ],
                //           ),
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // ),
                // Card(
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   elevation: 5.0,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //   child:Column(
                //     children:
                //     [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children:
                //           [
                //             Container(
                //               height: 115,
                //               width: 115,
                //               decoration:  BoxDecoration(
                //                 image: DecorationImage(
                //                   image: NetworkImage(
                //                       'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
                //                   ),
                //                   fit: BoxFit.cover,
                //                 ),
                //                 borderRadius:  BorderRadiusDirectional.all(Radius.circular(10.0)),
                //
                //               ),
                //             ),
                //             SizedBox(
                //               width: 18.0,
                //             ),
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children:
                //               [
                //                 Text(
                //                   'Giza',
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //
                //                   style: TextStyle(
                //                     fontSize: 20.0,
                //                     fontWeight: FontWeight.bold,
                //
                //                     color: Colors.black,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 8.0,
                //                 ),
                //                 RatingBar.builder(
                //                   itemSize:15.0,
                //                   initialRating:2,
                //                   minRating: 3.0,
                //                   direction: Axis.horizontal,
                //                   allowHalfRating: true,
                //                   itemCount: 5,
                //                   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                //                   itemBuilder: (context, _) => const Icon(
                //                     Icons.star,
                //                     color: Colors.orange,
                //                   ),
                //                   onRatingUpdate: (rating) {
                //                     print(rating);
                //                   },
                //                   glowColor: Colors.blue,
                //                 ),
                //                 SizedBox(
                //                   height: 8.0,
                //                 ),
                //                 Text(
                //                   'Enjoy your trip',
                //
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //
                //                   style: TextStyle(
                //                     fontSize: 18.0,
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.grey,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 9.0,
                //                 ),
                //                 Row(
                //                   children:
                //                   [
                //                     Icon(
                //                       Icons.location_on,
                //                       size: 15.0,
                //                       color: Colors.orange,
                //                     ),
                //                     SizedBox(
                //                       width: 8.0,
                //                     ),
                //                     Text(
                //                       '150 m',
                //                       style: TextStyle(
                //                         fontSize: 15.0,
                //                         fontWeight: FontWeight.normal,
                //                         color: Colors.grey,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //
                //               ],
                //             ),
                //             SizedBox(
                //               width: 18.0,
                //             ),
                //             CircleAvatar(
                //               backgroundColor: Colors.grey[300],
                //               radius: 15.0,
                //               child: IconButton(
                //                 onPressed: ()
                //                 {
                //
                //                 },
                //                 icon: const Icon(
                //                   Icons.favorite,
                //                   size: 15.0,
                //                   color: Colors.red,
                //                 ),
                //               ),
                //             ),
                //
                //
                //
                //             // Stack(
                //             //   children:
                //             //   [
                //             //     Container(
                //             //       height: 145,
                //             //       width: 312,
                //             //       decoration:  BoxDecoration(
                //             //         image: DecorationImage(
                //             //           image: NetworkImage(
                //             //               'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
                //             //           ),
                //             //           fit: BoxFit.cover,
                //             //         ),
                //             //         borderRadius:  BorderRadiusDirectional.only(
                //             //           topStart: Radius.circular(20.0),
                //             //           topEnd: Radius.circular(20.0),
                //             //         ),
                //             //
                //             //       ),
                //             //     ),
                //             //     Padding(
                //             //       padding: const EdgeInsets.all(15.0),
                //             //       child: Container(
                //             //         height: 30.0,
                //             //         width: 70.0,
                //             //         decoration:  BoxDecoration(
                //             //           borderRadius: BorderRadiusDirectional.horizontal(
                //             //             end: Radius.circular(20.0),
                //             //             start:  Radius.circular(20.0),
                //             //           ),
                //             //           color: Colors.white,
                //             //         ),
                //             //         child:  Center(
                //             //           child: Padding(
                //             //             padding: const EdgeInsets.all(8.0),
                //             //             child: Row(
                //             //
                //             //               crossAxisAlignment: CrossAxisAlignment.end,
                //             //               children:
                //             //               [
                //             //                 RatingBar.builder(
                //             //                   itemSize:16.0,
                //             //                   initialRating:2,
                //             //                   minRating: 1.0,
                //             //                   direction: Axis.horizontal,
                //             //                   allowHalfRating: true,
                //             //                   itemCount: 1,
                //             //                   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                //             //                   itemBuilder: (context, _) => const Icon(
                //             //                     Icons.star,
                //             //                     color: Colors.orange,
                //             //                   ),
                //             //                   onRatingUpdate: (rating) {
                //             //                     print(rating);
                //             //                   },
                //             //                   glowColor: Colors.blue,
                //             //                 ),
                //             //                 SizedBox(
                //             //                   width: 3.0,
                //             //                 ),
                //             //                 Text(
                //             //                   '4.2',
                //             //
                //             //                   maxLines: 1,
                //             //                   overflow: TextOverflow.ellipsis,
                //             //
                //             //                   style: TextStyle(
                //             //                     fontSize: 12.0,
                //             //                     fontWeight: FontWeight.bold,
                //             //
                //             //                     color: Colors.grey,
                //             //                   ),
                //             //                 ),
                //             //               ],
                //             //             ),
                //             //           ),
                //             //         ),
                //             //       ),
                //             //     ),
                //             //     Positioned(
                //             //       top: 15.0,
                //             //       right: 15.0,
                //             //       child: CircleAvatar(
                //             //         backgroundColor: Colors.white,
                //             //         radius: 15.0,
                //             //         child: IconButton(
                //             //           onPressed: ()
                //             //           {
                //             //
                //             //           },
                //             //           icon: const Icon(
                //             //             Icons.favorite,
                //             //             size: 15.0,
                //             //             color: Colors.red,
                //             //           ),
                //             //         ),
                //             //       ),
                //             //     ),
                //             //
                //             //
                //             //   ],
                //             // ),
                //
                //
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         height: 10.0,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );




  }

  Widget buildPlaces(Places model , context , index) => Card(

    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      children:
      [
        Stack(
          children:
          [
            Container(
              height: 145,
              width: 312,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '${model.image}'
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius:  BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.0),
                  topEnd: Radius.circular(20.0),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 30.0,
                width: 138.0,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadiusDirectional.horizontal(
                    end: Radius.circular(20.0),
                    start:  Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:
                      [
                        RatingBar.builder(

                          itemSize:14.0,
                          initialRating:model.rating!,
                          minRating: 1.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          glowColor: Colors.white,
                          ignoreGestures: true,



                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          '${model.reviewsCount} review',

                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,

                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6.0,
              right: 5.0,
              child: IconButton(
                onPressed: ()
                {

                  TriperAppCubit.get(context).AddPlacefavorite(id: model.id!
                  );

                },
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: (TriperAppCubit.get(context).favoritesMostPopular[model.id] != null && TriperAppCubit.get(context).favoritesMostPopular[model.id]!)
                      ? Colors.red : Colors.grey,
                  child: Icon(
                    Icons.favorite_border,
                    size: 14.0,
                    color: Colors.white,
                  ),
                ),

              ),
            ),


          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding:  EdgeInsetsDirectional.only(
                start: 18.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children:
              [
                Text(
                  '${model.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${model.description}',


                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children:
                  [
                    Icon(
                      Icons.location_on,
                      size: 15.0,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '${model.distance}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

              ],
            ),
          ),
        ),

      ],
    ),
  );
  Widget buildPlans(GetWishlistPlan model , context , index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child:Column(
      children:
      [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                height: 115,
                width: 115,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${model.images ?? 'https://img.freepik.com/free-photo/camel-caravan-desert-sunrise-ai-generated-image_511042-1678.jpg?w=1380&t=st=1687033976~exp=1687034576~hmac=44c83265dba634f6a538f2ddf8c7b70da0454b0c1ae3e0acbe50151d0d4e6c51'}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:  BorderRadiusDirectional.all(Radius.circular(10.0)),

                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Container(

                    child: Text(
                    '${model.title } ',

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                        color: Colors.black,
                      ),
                    ),
                    width: 95.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  RatingBar.builder(

                    itemSize:15.0,
                    initialRating:model.rating!.toDouble(),
                    minRating: 0.0 ,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    glowColor: Colors.blue,
                    ignoreGestures: true,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: 95.0,
                    child: Text(
                      '${model.description} ',

                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  // Row(
                  //   children:
                  //   [
                  //     Icon(
                  //       Icons.location_on,
                  //       size: 15.0,
                  //       color: Colors.orange,
                  //     ),
                  //     SizedBox(
                  //       width: 8.0,
                  //     ),
                  //     Text(
                  //       '150 m',
                  //       style: TextStyle(
                  //         fontSize: 15.0,
                  //         fontWeight: FontWeight.normal,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                ],
              ),
              SizedBox(
                width: 18.0,
              ),
              IconButton(
                onPressed: ()
                {
                  TriperAppCubit.get(context).changeFavorites(
                    model.id!
                  );
                },
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: TriperAppCubit.get(context).favorites[model.id] != null && TriperAppCubit.get(context).favorites[model.id]! ? Colors.red : Colors.grey,
                  child: Icon(
                    Icons.favorite_border,
                    size: 14.0,
                    color: Colors.white,
                  ),
                ),

              ),



              // Stack(
              //   children:
              //   [
              //     Container(
              //       height: 145,
              //       width: 312,
              //       decoration:  BoxDecoration(
              //         image: DecorationImage(
              //           image: NetworkImage(
              //               'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
              //           ),
              //           fit: BoxFit.cover,
              //         ),
              //         borderRadius:  BorderRadiusDirectional.only(
              //           topStart: Radius.circular(20.0),
              //           topEnd: Radius.circular(20.0),
              //         ),
              //
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Container(
              //         height: 30.0,
              //         width: 70.0,
              //         decoration:  BoxDecoration(
              //           borderRadius: BorderRadiusDirectional.horizontal(
              //             end: Radius.circular(20.0),
              //             start:  Radius.circular(20.0),
              //           ),
              //           color: Colors.white,
              //         ),
              //         child:  Center(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //
              //               crossAxisAlignment: CrossAxisAlignment.end,
              //               children:
              //               [
              //                 RatingBar.builder(
              //                   itemSize:16.0,
              //                   initialRating:2,
              //                   minRating: 1.0,
              //                   direction: Axis.horizontal,
              //                   allowHalfRating: true,
              //                   itemCount: 1,
              //                   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              //                   itemBuilder: (context, _) => const Icon(
              //                     Icons.star,
              //                     color: Colors.orange,
              //                   ),
              //                   onRatingUpdate: (rating) {
              //                     print(rating);
              //                   },
              //                   glowColor: Colors.blue,
              //                 ),
              //                 SizedBox(
              //                   width: 3.0,
              //                 ),
              //                 Text(
              //                   '4.2',
              //
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //
              //                   style: TextStyle(
              //                     fontSize: 12.0,
              //                     fontWeight: FontWeight.bold,
              //
              //                     color: Colors.grey,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: 15.0,
              //       right: 15.0,
              //       child: CircleAvatar(
              //         backgroundColor: Colors.white,
              //         radius: 15.0,
              //         child: IconButton(
              //           onPressed: ()
              //           {
              //
              //           },
              //           icon: const Icon(
              //             Icons.favorite,
              //             size: 15.0,
              //             color: Colors.red,
              //           ),
              //         ),
              //       ),
              //     ),
              //
              //
              //   ],
              // ),


            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );

}


