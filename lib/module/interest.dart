import 'package:flutter/material.dart';
import 'package:trip_app/layout/cubit/triper_screen_latout.dart';
import 'package:trip_app/shared/components/components.dart';


class Interest {
  final int? id;
  final String? name;
  bool isSelected;

  Interest({ this.id,  this.name, this.isSelected = false});
}

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();

}

class _InterestsScreenState extends State<InterestsScreen> {
  List<Interest> interests = [
    Interest(id: 1, name: 'Travel'),
    Interest(id: 2, name: 'Photography'),
    Interest(id: 3, name: 'Technology'),
    Interest(id: 4, name: 'Sports'),
    Interest(id: 5, name: 'Food'),

  ];
  int maxSelections = 5;
  List<Interest> selectedInterests = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Choose your interests that you like ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10,),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: interests.map((interest) {
                  return ChoiceChip(
                    selectedColor: Colors.teal,
                    // labelStyle: TextStyle(color: Colors.white),selectedShadowColor: Colors.white,
                    label: Text(interest.name??'tripe'),
                    selected: interest.isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          if (selectedInterests.length < maxSelections) {
                            interest.isSelected = selected;
                            selectedInterests.add(interest);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'You can select up to $maxSelections interests.',
                                ),
                              ),
                            );
                          }
                        } else {
                          interest.isSelected = selected;
                          selectedInterests.remove(interest);
                        }

                      });
                    },
                  );
                }).toList(),
              ),

            ],
          ),
        ),
        bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),),
                  onPressed: ()
                  {
                    navigateAndFinish(context, HomeScreen());
                  }, child: Text('Next')),
              SizedBox(width: 60,),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),),
                  onPressed: ()
                  {
                    navigateAndFinish(context, HomeScreen());
                  }, child: Text('Skip')),
            ],
           ),
        );
    }
}