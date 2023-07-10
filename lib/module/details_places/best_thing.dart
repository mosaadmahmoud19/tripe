import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/shared/components/components.dart';


class BestPlanDetails extends StatelessWidget {
  final id;

  const BestPlanDetails({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TriperAppCubit()..getAllDetails(id),
        child: BlocConsumer<TriperAppCubit, TriperAppStates>(
            listener: (BuildContext context, TriperAppStates state) {},
            builder: (BuildContext context, TriperAppStates state) {
              var model =TriperAppCubit.get(context).placeData.data?.place;
              if (model == null) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            child: Stack(children: [
                              Image.network(
                                 '${model.image!.isNotEmpty ? model.image : 'https://img.freepik.com/free-vector/flat-egypt-travel-round-greeting-card-with-colorful-traditional-egyptian-symbols-elements-isolated-illustration_1284-52394.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais'}',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Error occurred while loading the image, show a placeholder image instead
                                    return Image.network(
                                      'https://img.freepik.com/premium-photo/road-giza_219717-5958.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais', // URL of the placeholder image
                                      fit: BoxFit.cover,
                                    );
                                   },
                                  height: 340),
                              Positioned(
                                bottom: 30,
                                left: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.name ?? '',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          model.city ?? '',
                                          style: TextStyle(fontSize:14,color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ])),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:  [
                            Text(
                              model.rating?.toString() ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              model.reviewsCount?.toString()??'',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            TextButton(onPressed: ()
                            {
                              navigateTo(context, RatingAndReviewsScreen(
                                idPlace: model.id,
                              ));
                            },
                              child: Text(
                              'review ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'About',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.indigoAccent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          model.description ??"There is no description",
                          // maxLines: 5,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Gallary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.indigoAccent),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return  Container(
                              height: 100,
                              padding: EdgeInsets.all(5),
                              child:ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    // model.images?[index] ?? '',
                                      '${model.images![index]!.isNotEmpty
                                          ? model.images![index]
                                          : 'https://img.freepik.com/free-vector/flat-egypt-travel-round-greeting-card-with-colorful-traditional-egyptian-symbols-elements-isolated-illustration_1284-52394.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais'}',
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        // Error occurred while loading the image, show a placeholder image instead
                                        return Image.network(
                                          'https://img.freepik.com/premium-photo/road-giza_219717-5958.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais', // URL of the placeholder image
                                          fit: BoxFit.cover,
                                        );
                                      },
                                     )),
                            );
                          },
                          itemCount: model.images?.length ?? 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Related plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.indigoAccent),
                        ),
                      ),
                      Container(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final relatedPlan= TriperAppCubit.get(context).placeData.data?.plans?.elementAt(index);
                            return  relatedPlan != null ?  Container(
                              padding: EdgeInsets.all(10),
                              width: 250,
                              height: 350,
                              child: Stack(children: [
                                ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  // '${relatedPlan.images??''}',
                                  '${relatedPlan.images!.isNotEmpty
                                      ? relatedPlan.images
                                      : 'https://img.freepik.com/free-vector/flat-egypt-travel-round-greeting-card-with-colorful-traditional-egyptian-symbols-elements-isolated-illustration_1284-52394.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais'}',

                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Error occurred while loading the image, show a placeholder image instead
                                    return Image.network(
                                      'https://img.freepik.com/premium-photo/road-giza_219717-5958.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=ais', // URL of the placeholder image
                                      fit: BoxFit.cover,
                                      width: 250,
                                      height: 350,
                                    );
                                  },
                                  width: 250,
                                  height: 350,
                                ),
                               ),
                                Positioned(
                                    bottom: 30,
                                    left: 35,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width:70,
                                            child: Text(
                                              '${relatedPlan.title??''}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors
                                                    .orangeAccent.shade200,
                                                size: 15,
                                              ),
                                              Text(
                                                '${relatedPlan.rating}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color:
                                                    Colors.blueAccent),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                              ]),
                            ):SizedBox.shrink();
                          },
                          itemCount:  TriperAppCubit.get(context).placeData.data?.plans?.length??0,
                        ),
                      )
                    ],
                  ),
                ),);}
        ));
  }
}