import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_app/models/categories_tag_model.dart';
import 'package:trip_app/models/city_model.dart';
import 'package:trip_app/module/search_screen/cubit/cubit.dart';
import 'package:trip_app/module/search_screen/cubit/states.dart';

import '../../models/search_filter_model.dart';

class FilterSearchScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var searchFilterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => SearchCubit()..getCategoriesTagFilterSearch()..getCityFilterSearch(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
          builder: (context,state)
          {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: Text(
                    "Filter",
                  style: TextStyle(
                    color: Colors.teal,

                  ),

                ),
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child:
                    Form(
                      key: formKey,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.01, top: size.height * 0.02),
                          child: TextFormField(
                            
                            style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 240, 240, 240),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                              hintStyle: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              hintText: "Enter Keyoword",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            controller: searchFilterController,

                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (String? text)
                            {


                            },
                            validator: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'please enter your keyword';
                              }
                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Type ",
                                style:
                                TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: size.height * 0.01),
                            width: size.width,
                            height: 70,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: SearchCubit.get(context).Type.length,
                              separatorBuilder: (context, index) => SizedBox(width: 16.0),
                              itemBuilder: (context, index) {
                                final type = SearchCubit.get(context).Type[index];
                                return GestureDetector(
                                  onTap: () {
                                    SearchCubit.get(context).changeType(type);
                                    print(type);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: SearchCubit.get(context).selectedType == type
                                          ? Colors.teal
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          SearchCubit.get(context).typeIcons[index],
                                          color:
                                          SearchCubit.get(context).selectedType == type ? Colors.white : null,
                                        ),
                                        Text(
                                          type,
                                          style: TextStyle(
                                            color: SearchCubit.get(context).selectedType == type
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Categories ",
                                style:
                                TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.01, top: size.height * 0.02),
                          child: Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButton<String>(
                              value: SearchCubit.get(context).selectedInterestId,
                              icon: Icon(Icons.arrow_drop_down , color: Colors.teal),
                              elevation: 8,
                              underline: Container(),
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Icon(Icons.home , color: Colors.teal,), // Replace `your_icon` with the desired icon
                                  SizedBox(width: 8), // Add some spacing between the icon and the selected value
                                  Text('Select Categories'), // Replace with your desired hint text
                                ],
                              ),
                              onChanged: (String? newValue) {
                                print('new value categories :$newValue');
                                SearchCubit.get(context).changeCategories(newValue);
                                print('id from categories is :${SearchCubit.get(context).selectedInterestId}');

                              },
                              items:
                              SearchCubit.get(context).interst?.map((Interests interests) {
                                return DropdownMenuItem<String>(
                                  value: interests.id.toString(),
                                  child: Text(interests.name ?? 'category'),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "City ",
                                style:
                                TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: size.height * 0.01, top: size.height * 0.02),
                          child: Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButton<String>(
                              value: SearchCubit.get(context).selectedCitiesId,
                              icon: Icon(Icons.arrow_drop_down , color: Colors.teal),
                              elevation: 8,
                              underline: Container(),
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Icon(Icons.home , color: Colors.teal,), // Replace `your_icon` with the desired icon
                                  SizedBox(width: 8), // Add some spacing between the icon and the selected value
                                  Text('Select City'), // Replace with your desired hint text
                                ],
                              ),
                              onChanged: (String? newValue) {
                                print('new value city :$newValue');
                                SearchCubit.get(context).changeCity(newValue);
                                print('id from city is :${SearchCubit.get(context).selectedCitiesId}');

                              },
                              items:
                              SearchCubit.get(context).citiies?.map((Cities city) {
                                return DropdownMenuItem<String>(
                                  value: city.id.toString(),
                                  child: Text(city.name ?? 'city'),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rate",
                                style:
                                TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: size.height * 0.01),
                            width: size.width,
                            height: 70,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: SearchCubit.get(context).Rate.length,
                              separatorBuilder: (context, index) => SizedBox(width: 16.0),
                              itemBuilder: (context, index) {
                                final rate = SearchCubit.get(context).Rate[index];
                                return GestureDetector(
                                  onTap: () {
                                    SearchCubit.get(context).changeRated(rate);
                                  },
                                  child: Container(
                                    height: 20,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: SearchCubit.get(context).selectedRate == rate
                                          ? Colors.teal
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          SearchCubit.get(context).rateIcons[index],
                                          color:
                                          SearchCubit.get(context).selectedRate == rate ? Colors.white : Colors.yellow,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "${rate}",
                                          style: TextStyle(
                                            color: SearchCubit.get(context).selectedRate == rate
                                                ? Colors.white
                                                : null,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold ,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 50.0
                          ),
                          child: ConditionalBuilder(
                              condition: state is! SearchFilterLoadingState,
                              builder: (context)
                              {
                             return  Container(
                               decoration: BoxDecoration(
                                borderRadius:  BorderRadius.circular(15.0),
                                 color: Colors.teal,
                               ),
                               height: 50.0,
                               width: 200.0,

                               child: Center(
                                 child: TextButton(
                                      child: Text(
                                        'Search Wih Filter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {
                                         SearchCubit.get(context).postFilterSearch(searchFilterController.text);
                                        }
                                      },
                                    ),
                               ),
                             );
                              },
                              fallback: (context)=> Center(child: CircularProgressIndicator(
                                color: Colors.teal,
                              )),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        if(state is SearchFilterSuccessState)
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index)
                            {
                              final filterSearchData = SearchCubit.get(context).searchFilterModel.data?.places?.elementAt(index);
                              return filterSearchData != null ?  buildFilterSearchItem(filterSearchData) : SizedBox.shrink();
                            } ,
                            separatorBuilder: (context,index) => SizedBox(
                              height: 35.0,
                            ),
                            itemCount:SearchCubit.get(context).searchFilterModel.data?.places?.length ?? 0,
                          ),
                      ]),
                    ),
                  ),
                ),
              ),
            );
          },

      ),

    );
  }

  Widget buildFilterSearchItem(Places model)=>  Column(
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
                      ignoreGestures: true,
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
                      ' ${model.rating ?? 0} (${model.reviewsCount ?? 0} Reviews)',
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
