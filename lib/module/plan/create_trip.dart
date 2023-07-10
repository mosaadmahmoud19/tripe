import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/layout/cubit/triper_screen_latout.dart';
import 'package:trip_app/module/plan/custom_build_box_decoration.dart';
import 'package:trip_app/module/plan/size_confige.dart';


import 'details_of_plan.dart';

class CreateTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => TriperAppCubit()
        ..dispose()
        ..initState(),
      child: BlocConsumer<TriperAppCubit, TriperAppStates>(
          listener: (BuildContext context, TriperAppStates state) {},
          builder: (BuildContext context, TriperAppStates state) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    PageView(
                      controller: TriperAppCubit.get(context).pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 130,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Plan a New trip',
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  'Choose the city you want to enjoy, then select your starting and ending Time ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  height: 60,
                                  decoration: customBuildBoxDecoration(
                                      dx: 0,
                                      dy: 3,
                                      BLeft: 15,
                                      BRight: 15,
                                      TRight: 15,
                                      TLeft: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Where To Go ? : ',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      DropdownButton<String>(
                                        hint: Text("Choose city"),
                                        value: TriperAppCubit.get(context)
                                            .selectedGovernorate,
                                        onChanged: (value) {
                                          TriperAppCubit.get(context)
                                              .changeValue(value);

                                        },
                                        items: TriperAppCubit.get(context)
                                            .governorates
                                            .map((String governorate) {
                                          return DropdownMenuItem<String>(
                                            value: governorate,
                                            child: Text(governorate),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        decoration: customBuildBoxDecoration(
                                            dx: 0,
                                            dy: 3,
                                            BLeft: 15,
                                            BRight: 15,
                                            TRight: 15,
                                            TLeft: 15),
                                        child: TextFormField(
                                          readOnly: true,
                                          onTap: () async {
                                            final TimeOfDay? picked =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );

                                            if (picked != null) {
                                              TriperAppCubit.get(context)
                                                  .startTime(picked);
                                            }
                                          },
                                          controller: TextEditingController(
                                              text: TriperAppCubit.get(context)
                                                          .selectedTime !=
                                                      null
                                                  ? TriperAppCubit.get(context)
                                                      .selectedTime
                                                      .toString()
                                                  : ''),
                                          decoration: InputDecoration(
                                            hintText: 'Start Time',
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 12.0,
                                        ),
                                        decoration: customBuildBoxDecoration(
                                            dx: 0,
                                            dy: 3,
                                            BLeft: 15,
                                            BRight: 15,
                                            TRight: 15,
                                            TLeft: 15),
                                        child: TextFormField(
                                          readOnly: true,
                                          onTap: () async {
                                            final TimeOfDay? picked =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            );

                                            if (picked != null) {
                                              TriperAppCubit.get(context)
                                                  .EndTime(picked);

                                            }
                                          },
                                          controller: TextEditingController(
                                              text: TriperAppCubit.get(context)
                                                          .selectedTimeDay !=
                                                      null
                                                  ? TriperAppCubit.get(context)
                                                      .selectedTimeDay
                                                      .toString()
                                                  : ''),
                                          decoration: InputDecoration(
                                            hintText: 'End Time',
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Describe your Trip',
                                      style: GoogleFonts.roboto(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text(
                                    'Tell us your trip details and what kind of plans you prefer ',
                                    style: GoogleFonts.roboto(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Describe your Plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter text here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Type of trip',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            spacing: 4,
                                            children: List.generate(
                                              TriperAppCubit.get(context)
                                                  .options
                                                  .length,
                                              (index) => FilterChip(
                                                label: Text(
                                                    TriperAppCubit.get(context)
                                                        .options[index]),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                //avatar: Icon(Icons.account_balance),
                                                selectedColor: Colors.teal,
                                                selected: TriperAppCubit.get(context)
                                                        .isSelected ==
                                                    index,
                                                onSelected: (select) {
                                                  TriperAppCubit.get(context)
                                                      .typeSelected(index);
                                                  // setState(() => {
                                                  //   isSelected = select ? index:null
                                                  //isSelected = select ?index:null;
                                                  // });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        width: SizeConfig.screenWidth! * 1,
                        height: SizeConfig.screenHeight! * .13,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SmoothPageIndicator(
                                count: 2,
                                controller:
                                    TriperAppCubit.get(context).pageController!,
                                effect: const ExpandingDotsEffect(
                                    activeDotColor: Colors.teal,
                                    dotColor: Colors.grey,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    expansionFactor: 3,
                                    spacing: 5.0),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.teal,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ));
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: SizeConfig.defaultSize! * 3,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                if (TriperAppCubit.get(context)
                                    .pageController!
                                    .page ==
                                    2) {
                                  TriperAppCubit.get(context)
                                      .pageController!
                                      .animateToPage(1,
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                } else if (TriperAppCubit.get(context)
                                    .pageController!
                                    .page ==
                                    1) {
                                  TriperAppCubit.get(context)
                                      .pageController!
                                      .animateToPage(0,
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }else {
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                height: 45,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                    child:
                                    Icon(Icons.keyboard_return_outlined)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: InkWell(
                              onTap: () {
                                TriperAppCubit.get(context).pageController!.nextPage(
                                  duration:
                                  const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );

                              },
                              child: Container(
                                height: 45,
                                width: SizeConfig.screenWidth! * .78,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
