import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/models/get_place_review.dart';
import 'package:trip_app/models/get_plan_review.dart';
import 'package:trip_app/models/home_model.dart';
import 'package:trip_app/shared/components/components.dart';
import 'package:trip_app/shared/network/local/cache_helper.dart';

class RatingAndReviewsScreen extends StatelessWidget {



  final idPlace;

  RatingAndReviewsScreen({

    this.idPlace,
});


  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var commentController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriperAppCubit,TriperAppStates>(
      listener: (context,state)
      {
            if(state is AddPlanReviewSuccessState )
            {
              if(state.storeReviewModel.result == "success")
              {
                showToast(
                    state: ToastStates.SUCCESS,
                  text: state.storeReviewModel.message,
                );
                Navigator.pop(context);
              }
            }



      },
        builder: (context,state)
        {
          var cubit = TriperAppCubit.get(context);
          return  Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 0.0,
              title: Center(
                child: Text(
                  'Rating and Review',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal
                  ),
                ),
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
                      Text(
                        'Choose your rate',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.teal,
                        ),
                      ),

                      Container(
                        padding: EdgeInsetsDirectional.only(start: 130.0),
                        child: DropdownButton<String>(
                          value: TriperAppCubit.get(context).selectedTypeItem,
                          items: TriperAppCubit.get(context).itemList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? item)
                          {

                            TriperAppCubit.get(context).changeItems(item!);
                            print(TriperAppCubit.get(context).selectedTypeItem);// Update Cubit's state
                            // Update Cubit's state
                          },
                          iconEnabledColor: Colors.teal,
                        ),
                      ),



                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
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
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children:
                                      [
                                        const Text(
                                          'Add Rating',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
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
                                          onRatingUpdate: (rating)
                                          {
                                            int ratingInt = rating.toInt();
                                            TriperAppCubit.get(context).changeRating(ratingInt);
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
                                              borderSide: const BorderSide(color: Colors.grey),
                                            ),



                                          ),


                                        ),
                                        SizedBox(
                                          height: 50.0,
                                        ),
                                        ConditionalBuilder(
                                          condition: state is! AddPlanReviewLoadingState,
                                          builder: (context) => Container(
                                            width: 300.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadiusDirectional.circular(20.0),
                                              color: Colors.teal,
                                            ),
                                            child: MaterialButton(
                                              onPressed: ()
                                              {
                                                if(formKey.currentState!.validate())
                                                {
                                                  TriperAppCubit.get(context).addReview(

                                                    rating: TriperAppCubit.get(context).ratingItems,

                                                    comment: commentController.text,



                                                    idPlace: idPlace,


                                                  );

                                                }


                                              },
                                              child: const Text(
                                                'submit',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),

                                            ),
                                          ),
                                          fallback: (context) =>
                                              Center(

                                                child: CircularProgressIndicator(),

                                              ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ),


                              ),
                            );


                          },
                          child: const Text(
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
                      // Text(
                      //   ' ${}',
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 18.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //
                      // ),
                      // RatingBar.builder(
                      //   itemSize:20.0,
                      //   initialRating:1,
                      //   minRating: 1.0,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 1,
                      //   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      //
                      //   itemBuilder: (context, _) => const Icon(
                      //     Icons.star,
                      //     color: Colors.orange,
                      //   ),
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
                      //   glowColor: Colors.blue,
                      // ),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(TriperAppCubit.get(context).selectedTypeItem == 'place')
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap:  true,
                          itemBuilder: (context , index)
                          {
                            final placeReview =cubit.getPlaceReviewModel.data?.reviews?.data?.elementAt(index);
                            return placeReview != null ? buildPlaceItems(placeReview ,context) : SizedBox.shrink();
                          },
                        itemCount: cubit.getPlaceReviewModel.data?.reviews?.data?.length,

                      ),
                    ),
                  if(TriperAppCubit.get(context).selectedTypeItem == 'plan')
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap:  true,
                        itemBuilder: (context , index)
                        {
                          final planReview =cubit.getPlanReviewModel.data?.reviews?.data?.elementAt(index);
                          return planReview != null ? buildPlanItems(planReview ,context) : SizedBox.shrink();
                        },
                        itemCount: cubit.getPlanReviewModel.data?.reviews?.data?.length,

                      ),
                    ),




                ],
              ),
            ),
          );
        },
    );
  }

  Widget buildPlanItems(DataUserPlan plan, context) => Card(
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
                  '${plan.user?.image}'
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
                      '${plan.user?.fullname}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${plan.createdAt}',
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
                initialRating: plan.rating!.toDouble(),
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
                ignoreGestures: true,
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
            ' ${plan.comment} ',
            style: Theme.of(context).textTheme.subtitle1,

          ),
          SizedBox(
            height: 5.0,
          ),

        ],
      ),
    ),
  );

  Widget buildPlaceItems(DataUser model , context) => Card(
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
                   '${model.user?.image}',
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
                  '${model.user?.fullname}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model.createdAt}',
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
                ignoreGestures: true,
                itemSize:15.0,
                initialRating:model.rating!.toDouble(),
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
                glowColor: Colors.white,
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
            '${model.comment}',
            style: Theme.of(context).textTheme.subtitle1,

          ),
          SizedBox(
            height: 5.0,
          ),

        ],
      ),
    ),
  );
}






