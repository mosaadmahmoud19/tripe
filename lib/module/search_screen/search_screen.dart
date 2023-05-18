import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_app/models/search_model.dart';
import 'package:trip_app/module/search_screen/cubit/cubit.dart';
import 'package:trip_app/module/search_screen/cubit/states.dart';
import 'package:trip_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
     child: BlocConsumer<SearchCubit,SearchStates>(
       listener: (context,state){},
       builder: (context,state)
       {
         return Scaffold(
           appBar: AppBar(),
           body: Padding(
             padding: const EdgeInsets.all(25.0),
             child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
               child: Form(
                 key: formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:
                   [
                     Text(
                       'Search',
                       style: TextStyle(
                         fontSize: 25.0,

                         color: Colors.orangeAccent,
                       ),
                     ),
                     SizedBox(
                       height: 40.0,
                     ),

                     TextFormField(
                       decoration: InputDecoration(
                           filled: true,
                           prefixIcon: Icon(
                             Icons.search,
                           ),
                           fillColor: Colors.grey.shade200,
                           hintText: 'Search',
                           labelStyle: TextStyle(
                             color: Colors.blueAccent,
                           ),
                           hintStyle: TextStyle(
                             color: Colors.grey.shade400,
                           ),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0),
                             borderSide: BorderSide(color: Colors.grey.shade400),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0),
                             borderSide: BorderSide(color: Colors.grey.shade400),
                           ),
                           constraints: BoxConstraints(
                             minHeight: 1.0,
                           ),
                           //

                         ),

                       controller: searchController,

                       keyboardType: TextInputType.text,
                       onFieldSubmitted: (String? text)
                       {
                         SearchCubit.get(context).postSearch(text!);

                       },
                       validator: (String? value)
                       {
                         if(value!.isEmpty)
                         {
                           return 'please enter your search';
                         }
                         return null;
                       },



                     ),
                     SizedBox(
                       height: 10.0,
                     ),
                     if(state is SearchLoadingState)
                     LinearProgressIndicator(),
                     SizedBox(
                       height: 10.0,
                     ),
                     if(state is SearchSuccessState)
                     ListView.separated(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context,index)
                       {
                         final searchData = SearchCubit.get(context).searchModel.data?.places?.elementAt(index);
                         return searchData != null ? buildSearchItem(searchData) : SizedBox.shrink();
                       } ,
                       separatorBuilder: (context,index) => SizedBox(
                         height: 35.0,
                       ),
                       itemCount:SearchCubit.get(context).searchModel.data?.places?.length ?? 0,
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );
       },
     ),
    );
  }

  Widget buildSearchItem(SearchPlaces model)=>  Column(
    children:
    [
      Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Container(
            height: 110,
            width: 90,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '${model.image??'https://img.freepik.com/free-vector/empty-luxury-hotel-hallway-interior_33099-1729.jpg?size=626&ext=jpg&ga=GA1.1.1639877958.1673805873&semt=sph%27'}'                ),
                fit: BoxFit.cover,
              ),
              borderRadius:  BorderRadius.all(
                Radius.circular(5.0),
              ),

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
                Row(

                  children:
                   [
                    Expanded(
                      child: Text(
                        '${model.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,

                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(

                  children:
                  [
                    RatingBar.builder(
                      itemSize:15.0 ,
                      initialRating: 3,
                      minRating: model.rating ?? 1.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      glowColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 1.0,
                    ),
                    Text(
                      ' ${model.rating ?? 0} (${model.reviews_count ?? 0} Reviews)',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 10.0,
                      ),

                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                    '${model.description}',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.green.shade200,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
