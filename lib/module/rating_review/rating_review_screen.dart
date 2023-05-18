import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/shared/components/components.dart';

class RatingAndReviewsScreen extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
            'Rating and Reviews'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:
          [
           Row(
             children:
             [
               Container(
                 width: 140.0,
                 height: 45.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadiusDirectional.circular(15.0),
                   color: Colors.grey.shade300,
                 ),
                 child: TextButton(
                   onPressed: ()
                   {
                     scaffoldKey.currentState?.showBottomSheet(
                             (context) => Container(
                               width: double.infinity,
                               height: 350.0,
                               decoration: BoxDecoration(
                                   color: Colors.grey[200],
                                 borderRadius: BorderRadiusDirectional.only(
                                   topStart: Radius.circular(40.0),
                                   topEnd: Radius.circular(40.0),

                                 )
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Column(
                                   children:
                                   [
                                     Text(
                                       'Add Rating',
                                       style: TextStyle(
                                         fontSize: 20.0,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.black,
                                       ),
                                     ),
                                     SizedBox(
                                       height: 20.0,
                                     ),
                                     RatingBar.builder(
                                       itemSize:50.0,
                                       ignoreGestures: false,
                                       initialRating:1.0,
                                       minRating: 0.0,
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
                                       glowColor: Colors.white,
                                     ),
                                     SizedBox(
                                       height: 20.0,
                                     ),
                                     TextFormField(
                                       maxLines: 2,

                                       controller: commentController,
                                       keyboardType: TextInputType.text,
                                       onFieldSubmitted: (value)
                                       {

                                       },

                                       validator: (String? value)
                                       {
                                         if(value!.isEmpty)
                                         {
                                           return 'please enter your comment ';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(



                                         hintText: 'write comment' ,
                                         hintStyle: TextStyle(
                                           color: Colors.grey.shade400,
                                         ),
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30.0),

                                         ),
                                         enabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30.0),
                                           borderSide: BorderSide(color: Colors.grey.shade400),
                                         ),
                                         focusedBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30.0),
                                           borderSide: BorderSide(color: Colors.grey),
                                         ),



                                       ),


                                     ),
                                     SizedBox(
                                       height: 50.0,
                                     ),
                                     Container(
                                       width: 300.0,
                                       height: 50.0,
                                       child: MaterialButton(
                                         onPressed: (){},
                                         child: Text(
                                             'submit',
                                           style: TextStyle(
                                             color: Colors.white,
                                           ),
                                         ),

                                       ),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadiusDirectional.circular(20.0),
                                         color: Colors.blueAccent,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),


                             ),
                     );
                   },
                   child: Text(
                     'Add Comment',
                     style: TextStyle(
                       fontSize: 16.0,
                       fontWeight: FontWeight.bold,
                       color: Colors.black54,
                     ),
                   ),
                 ),
               ),
               Spacer(),
               Text(
                 ' 4.5 ',
                 style: TextStyle(
                   color: Colors.grey,
                   fontSize: 18.0,
                   fontWeight: FontWeight.bold,
                 ),

               ),
               RatingBar.builder(
                 itemSize:20.0,
                 initialRating:1,
                 minRating: 1.0,
                 direction: Axis.horizontal,
                 allowHalfRating: true,
                 itemCount: 1,
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

             ],
           ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children:
                  [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        CircleAvatar(


                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [
                              Text(
                                'mosaad mahmoud',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  height: 1.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Apr 14, 2023',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style:Theme.of(context).textTheme.caption?.copyWith(
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        RatingBar.builder(
                          itemSize:15.0,
                          initialRating:1,
                          minRating: 1.0,
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

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],

                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisqua.rud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu',
                      style: Theme.of(context).textTheme.subtitle1,

                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}






