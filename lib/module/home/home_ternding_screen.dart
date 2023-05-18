import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/models/home_model.dart';
import 'package:trip_app/module/home/cubit/cubit.dart';
import 'package:trip_app/module/home/cubit/states.dart';

class HomeTrendingScreen extends StatelessWidget {
  const HomeTrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getAllHome(),
      child:BlocConsumer<HomeCubit,HomeStates>(

          listener: (context,state){},
          builder: (context,state)
          {

            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),

                  child: ConditionalBuilder(
                    condition: HomeCubit.get(context).homeModel.data?.home?.topRatedPlaces?.length != 0,
                    builder: (context) =>Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        const Text(
                          'Top Rated Places',
                          style: TextStyle(
                            fontSize: 25.0,

                            color: Colors.orangeAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),

                        Container(
                          height: 450.0,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index) => buildTopPlacesItem(HomeCubit.get(context).homeModel.data?.home?.topRatedPlaces![index]),
                            separatorBuilder: (context,index) => SizedBox(
                              width: 8.0,
                            ),
                            itemCount: HomeCubit.get(context).homeModel.data?.home?.topRatedPlaces?.length ?? 0,
                          ),
                        ),

                        const Text(
                          'Recommendation plans',
                          style: TextStyle(
                            fontSize: 25.0,

                            color: Colors.orangeAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 310,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 250,
                                            width: 150,
                                            padding: const EdgeInsets.all(15),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://img.freepik.com/free-photo/san-diego-dawn-early-morning-with-palm-tree-silhouette_649448-2514.jpg?w=1060&t=st=1679524077~exp=1679524677~hmac=cbeb602699e6a1716dc618dfa375f7816da766eb56d768b1a37275a15632a8f6'
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:  BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),

                                            ),
                                          ),
                                          Positioned(
                                            bottom: 7,
                                            right: 10,
                                            left: 10,
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'Alex',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                Spacer(),
                                                Text('3 Days',
                                                    style: TextStyle(color: Colors.white)),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Title',
                                          style: TextStyle(fontSize: 10, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Description for this place',
                                          style: TextStyle(fontSize: 10, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            itemCount: 15,
                          ),
                        ),

                      ],
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            );
          },

      )

    );
  }

  Widget buildTopPlacesItem( TopRatedPlaces? model) => Stack(


    children:
    [

      Container(
        height: 400,
        width: 300,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              '${model?.main_image??'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'}'
            ),
            fit: BoxFit.cover,
          ),
          borderRadius:  BorderRadius.all(
            Radius.circular(20.0),
          ),

        ),
      ),
      Row(
        children:
        [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 20.0,

            ),
            child: Container(
              height: 30.0,
              width: 130.0,
              decoration:  BoxDecoration(
                borderRadius: BorderRadiusDirectional.horizontal(
                  end: Radius.circular(20.0),
                ),
                color: Colors.white70,
              ),
              child:  Center(
                child: Text(
                  '${model?.name}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 138.0,
                top: 16.0
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15.0,
              child: IconButton(
                onPressed: (){},
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
      Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 200.0,
          start: 30.0,

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Row(

              children:
              [
                Container(

                  // child: Text(
                  //   '${model?.description}',
                  //   softWrap: true,
                  //   overflow: TextOverflow.ellipsis,
                  //   maxLines: 8,
                  //
                  //
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 15.0,
                  //     fontWeight: FontWeight.bold,
                  //
                  //
                  //   ),
                  // ),
                  width: 200.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 20.0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.dark_mode_rounded,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    radius: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
                children:
                [

                  RatingBar.builder(
                    itemSize:25.0,
                    initialRating:2,
                    minRating: model?.rating ?? 1.0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    glowColor: Colors.blue,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    ' ${model?.rating ?? 0} (${model?.reviews_count ?? 0} Reviews)',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 11.0,
                    ),

                  ),

                ]
            ),


          ],
        ),
      ),





    ],
  );
}
