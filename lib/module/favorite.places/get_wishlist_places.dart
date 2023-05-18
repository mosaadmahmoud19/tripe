import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GetWishListScreen extends StatelessWidget {
  const GetWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                color: Colors.green[300],
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
                      itemBuilder: (BuildContext context, index) => Card(
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
                                            'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
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
                                      width: 70.0,
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
                                                itemSize:16.0,
                                                initialRating:2,
                                                minRating: 1.0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 1,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                                glowColor: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 3.0,
                                              ),
                                              Text(
                                                '4.2',

                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,

                                                style: TextStyle(
                                                  fontSize: 12.0,
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
                                    top: 15.0,
                                    right: 15.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15.0,
                                      child: IconButton(
                                        onPressed: ()
                                        {

                                        },
                                        icon: const Icon(
                                          Icons.favorite,
                                          size: 15.0,
                                          color: Colors.red,
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
                                        'Giza',
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
                                        'Enjoy your trip',

                                        maxLines: 2,
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
                                            '150 m',
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
                        ),
                      itemCount: 8,

                    ),
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) => Card(
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
                                            'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
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
                                      Text(
                                        'Giza',
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
                                      RatingBar.builder(
                                        itemSize:15.0,
                                        initialRating:2,
                                        minRating: 3.0,
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
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        'Enjoy your trip',

                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9.0,
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
                                            '150 m',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    radius: 15.0,
                                    child: IconButton(
                                      onPressed: ()
                                      {

                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 15.0,
                                        color: Colors.red,
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
                      ),
                      itemCount: 8,

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
      ),

    );

  }

}


