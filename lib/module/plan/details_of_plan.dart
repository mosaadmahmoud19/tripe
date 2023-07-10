import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/models/details_plan_model.dart';
import 'package:trip_app/models/plan_details_model.dart';

class HomeTripDetailsPlanScreen extends StatelessWidget {
  final int? id;

  const HomeTripDetailsPlanScreen({Key? key ,required this.id}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>TriperAppCubit()..getPlanDetailsModel(id!),
      child: BlocConsumer<TriperAppCubit,TriperAppStates>
        (
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              elevation: 0.0,
              title:  Center(
                child: Text(
                  '${TriperAppCubit.get(context).planDetailsModel.data?.plans?.title??'Loading..'}',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  {
                    final detailsPlace = TriperAppCubit.get(context).planDetailsModel.data?.plans?.places?.elementAt(index);
                    return detailsPlace != null ? buildTripDetailsPlan(detailsPlace , context , index) : SizedBox.shrink();

                  },
                  separatorBuilder: (context, index) => Container(
                    height: 10.0,
                  ),
                  itemCount:  TriperAppCubit.get(context).planDetailsModel.data?.plans?.places?.length ?? 0,
                ),
              ),
            ),
          );
        },
      ),

    );
  }

  Widget buildTripDetailsPlan(Places model ,context , index){
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.teal,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: 300,
                  color: Colors.teal,
                )
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 2,
                            child:Image(
                              image: NetworkImage(
                                model.image != null
                                    ? model.image!
                                    : 'https://img.freepik.com/free-vector/time-travel-vector-flyer-with-white-copy-space-sky-with-airplane_134830-1061.jpg?w=1380&t=st=1687174267~exp=1687174867~hmac=c4acdb221ad59bc0f962fc6e5d5c174cd951aa6307ea891c3dff31b136056a5d',
                              ),                              height: 50.0,
                              width: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, top: 8, bottom: 5 , right: 16),

                                          child: Row(

                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:
                                            [
                                              Expanded(
                                                child: Text(
                                                  '${model.name}',

                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Colors.teal
                                                  ),
                                                ),
                                              ),
                                              RatingBar.builder(
                                                itemSize:15.0,
                                                initialRating:1,
                                                minRating: 1.0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 1,
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
                                                width: 3.0,
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
                                          ) ,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16,bottom: 8 , right: 16),
                                          child: Text(
                                            '${model.description}',

                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey
                                                    .withOpacity(0.8)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Divider(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: InkWell(
                                                child: Container(
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 28.0,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                onTap: (){},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: InkWell(
                                                child: Container(
                                                  child:Icon(
                                                    Icons.delete,
                                                    size: 28.0,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                onTap: (){},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );}

}

