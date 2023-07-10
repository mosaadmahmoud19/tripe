import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/module/favorite.places/get_wishlist_places.dart';
import 'package:trip_app/module/plan/create_trip.dart';
import 'package:trip_app/module/plan/custom_build_box_decoration.dart';
import 'package:trip_app/module/rating_review/rating_review_screen.dart';
import 'package:trip_app/shared/components/components.dart';
import '../../models/plan_model.dart';
import 'details_of_plan.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => TriperAppCubit()..getPlan(),
      child: BlocConsumer<TriperAppCubit,TriperAppStates>(
       listener: (context,state){},
       builder: (context,state)
       {
         //   final searchData = SearchCubit.get(context).searchModel.data?.places?.elementAt(index);
         //   return searchData != null ? buildSearchItem(searchData) : SizedBox.shrink();
         return Container(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Container(
                 padding: EdgeInsets.all(20),
                 color: Colors.white,
                 child: customCreatePlan(),
               ),
               Container(
                 decoration: customBuildBoxDecoration(dx: 0 , dy: 15 , BLeft: 15 , BRight: 15),
                 child: customShowAllPlans(),
               ),
               Expanded(
                   child: ConditionalBuilder(
                       condition: state is !GetPlanLoadingState,
                       builder: (context) =>ListView.separated(
                         physics: BouncingScrollPhysics(),
                         separatorBuilder: (context, index) => SizedBox(height: 15),
                         itemCount: TriperAppCubit.get(context).planModel.data?.plans?.length?? 0,

                         itemBuilder: (context, index) {
                           final planData = TriperAppCubit.get(context).planModel.data?.plans?.elementAt(index);

                           if (planData != null) {
                             final id = planData.id;

                             return InkWell(
                               onTap: () {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => HomeTripDetailsPlanScreen(
                                       id: id,
                                     ),
                                   ),
                                 );
                                 print('plan plan plaaaaaaaaan');
                               },
                               child: buildItemPlan(planData, index),
                             );
                           } else {
                             return SizedBox.shrink();
                           }
                         },
                       ),
                       fallback: (context) =>Center(child: CircularProgressIndicator(
                         color: Colors.teal,
                       )),
                   )),
             ],
           ),
         );
       },
      ),
    );
  }

  Widget buildItemPlan(Plans model ,int index) =>Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Container(
            decoration: customBuildBoxDecoration(dx: 0 , dy: 3 , TLeft: 15 , TRight: 15 , BRight: 15 , BLeft: 15),
            height: 150, // Add padding to the container
            child: Stack(
              children: [
                Row(
                  children: <Widget>[
                    customImagePlan(
                      imgUrl:'${model.places![0].image ?? 'https://img.freepik.com/free-vector/time-travel-vector-flyer-with-white-copy-space-sky-with-airplane_134830-1061.jpg?w=1380&t=st=1687174267~exp=1687174867~hmac=c4acdb221ad59bc0f962fc6e5d5c174cd951aa6307ea891c3dff31b136056a5d'}',
                      TLeft: 15.0,
                      BLeft: 15.0,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: customDescribePlan(
                        Title: '${model.title ??'Engoy'}',

                        Description:'${model.description ?? 'Engoy'}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 20, bottom: 15),
          child: customImagePlan(
            imgUrl:'${model.places![0].image ?? 'https://img.freepik.com/free-vector/time-travel-vector-flyer-with-white-copy-space-sky-with-airplane_134830-1061.jpg?w=1380&t=st=1687174267~exp=1687174867~hmac=c4acdb221ad59bc0f962fc6e5d5c174cd951aa6307ea891c3dff31b136056a5d'}',
            TLeft: 15,
            TRight: 15,
            BLeft: 15,
            BRight: 15,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 40, bottom: 10),
            child: customImagePlan(
              imgUrl:'${model.places![0].image ?? 'https://img.freepik.com/free-vector/time-travel-vector-flyer-with-white-copy-space-sky-with-airplane_134830-1061.jpg?w=1380&t=st=1687174267~exp=1687174867~hmac=c4acdb221ad59bc0f962fc6e5d5c174cd951aa6307ea891c3dff31b136056a5d'}',
              TRight: 15,
              TLeft: 15,
              BRight: 15,
              BLeft: 15,
            )),
      ],
    ),
  );
}

class customDescribePlan extends StatelessWidget {
  final String? Title;

  final String? Description;

  customDescribePlan({
    super.key,
    required this.Title,
    required this.Description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            Title!,
            style: GoogleFonts.roboto(
                fontSize: 15.0,
                fontWeight: FontWeight.bold), // Set the style for the text
          ),
        ),

        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            Description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}

class customImagePlan extends StatelessWidget {
  final double? TLeft;

  final double? TRight;

  final double? BLeft;

  final double? BRight;

  final String? imgUrl;

  customImagePlan({
    super.key,
    this.TLeft = 0,
    this.TRight = 0,
    this.BLeft = 0,
    this.BRight = 0,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(TLeft!),
        topRight: Radius.circular(TRight!),
        bottomLeft: Radius.circular(BLeft!),
        bottomRight: Radius.circular(BRight!),
      ),
      child: Image.network(
        imgUrl!,
        // Replace with the path to your image
        width: 120.0,
        // Set the width of the image
        height: 150.0,
        fit: BoxFit.cover,
        // Set the height of the image
      ),
    );
  }
}

class customShowAllPlans extends StatelessWidget {
  const customShowAllPlans({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          child: Text(
            'All plans ',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.read_more_outlined))
      ],
    );
  }
}

class customCreatePlan extends StatelessWidget {
  const customCreatePlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))

            ),

        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateTrip()));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Create your plan',
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ));
  }
}
