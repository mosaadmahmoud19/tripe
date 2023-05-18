import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class ExploreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: InkWell(
                // onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestDetails()));},
                child: Container(
                    height: 40,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15),),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5.0,),
                        Text('Where you want to go ',style: TextStyle(color: Colors.grey),),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Divider(
                thickness: 3,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Best Things ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => BestDetails()));
              },
              child: Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return buildMostPopular();
                  },
                  itemCount: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Top Rated',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return buildTopRated();
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Nearest Places',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildNearestPlaces();
                  },
                  itemCount: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildMostPopular()=>Stack(children: [
    Container(
      height: 200,
      width: 250,
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/premium-vector/pyramids-egypt-family-tourists-looks-egyptian-pyramids-vector-illustration_193165-301.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=sph'
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
    Positioned(
      bottom: 5,
      left: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Alexandria',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    ),
    Positioned(
      top: 10,
      right: 15,
      child: CircleAvatar(
          backgroundColor: Colors.yellow.shade700,
          child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,))),
    ),

  ]);
  Widget buildTopRated ( )=> Stack(children: [
    Container(
      height: 200,
      width: 250,
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/premium-photo/pyramid-complex-aswan-city-by-nile-aerial-view-egypt_400112-1000.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=sph'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    Positioned(
      bottom: 5,
      left: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Alexandria',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    ),
    Positioned(
      bottom: 5,
      right: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '7.5 k',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    ),


  ]);
  Widget buildNearestPlaces()=>Padding(
    padding: const EdgeInsets.only(left: 10.0,right: 5),
    child: Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network('https://img.freepik.com/premium-photo/great-sphinx-pyramid_219717-5429.jpg?size=626&ext=jpg&ga=GA1.2.55020483.1681863343&semt=sph')),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Pyramids',maxLines:1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10),
              Text('7.5 k'),
            ],
          ),SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(top: 5.0,),
            child: CircleAvatar(
                backgroundColor: Colors.yellow.shade700,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,))),
          ),
        ],
      ),
    ),
  );
}