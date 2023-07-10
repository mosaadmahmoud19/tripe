// import 'dart:convert';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trip_app/layout/cubit/cubit.dart';
// import 'package:trip_app/layout/cubit/states.dart';
// import 'package:trip_app/models/get_pkace_model.dart';
// import 'package:trip_app/module/get_place/cubit/cubit.dart';
// import 'package:trip_app/module/get_place/cubit/states.dart';
//
// class HomeTripDetailsPlanScreen extends StatelessWidget {
//   const HomeTripDetailsPlanScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TriperAppCubit,TriperAppStates>(
//
//       listener: (context,state){},
//       builder: (context,state)
//       {
//
//         return Scaffold(
//           backgroundColor: Colors.grey[100],
//           appBar: AppBar(
//             elevation: 0.0,
//             title: Center(
//               child: Text(
//                 'Trip Details plan',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(13.0),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: ListView.separated(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context,index)
//                 {
//                   // final imageData = TriperAppCubit.get(context).getPlaceModel.data?.image?.elementAt(index);
//                   // return imageData != null ? buildTripDetailsPlan(imageData, context) : SizedBox.shrink();
//                   return Text('bb');
//                 },
//                 separatorBuilder:(context,index) => Container(
//                   height: 10.0,
//                 ),
//                 itemCount:  0,
//               ),
//             ),
//           ),
//
//         );
//       },
//
//     );
//   }
//
//   Widget buildTripDetailsPlan(Images model , context) => Column(
//          mainAxisSize: MainAxisSize.max,
//     children:
//     [
//       Row(
//
//         children:
//         [
//           CircleAvatar(
//             radius: 12.0,
//             backgroundColor: Colors.black,
//             child: Text(
//               '${model.id}',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//
//
//           const SizedBox(
//             width: 20.0,
//           ),
//           Expanded(
//             child: Container(
//               height: 100,
//               width: 110,
//               decoration:  BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       '${model.image}',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius:  BorderRadiusDirectional.only(
//                   topStart: Radius.circular(10.0),
//                   bottomStart: Radius.circular(10.0),
//                 ),
//
//               ),
//             ),
//           ),
//           Container(
//             height: 100.0,
//             width: 165.0,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius:  BorderRadiusDirectional.only(
//                 topEnd: Radius.circular(10.0),
//                 bottomEnd: Radius.circular(10.0),
//               ),
//             ),
//             child: const Padding(
//               padding: EdgeInsetsDirectional.only(
//                 top: 25.0,
//                 start: 15.0,
//               ),
//               child: Text(
//                 'Jeih City Center',
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.italic,
//
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       const SizedBox(
//         height: 5.0,
//       ),
//       Padding(
//         padding: const EdgeInsetsDirectional.only(
//           start: 219.0,
//
//         ),
//         child: Row(
//           children:
//           [
//             IconButton(
//               icon: Icon(
//                 Icons.edit,
//                 size: 28.0,
//                 color: Colors.green,
//               ),
//               splashRadius: 20.0,
//
//               onPressed: (){},
//             ),
//             const SizedBox(
//               width: 5.0,
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.delete,
//                 size: 28.0,
//                 color: Colors.red,
//               ),
//               splashRadius: 20.0,
//               onPressed: (){},
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 15.0,
//       ),
//       Padding(
//         padding:  const EdgeInsetsDirectional.only(
//          start: 45.0,
//         ),
//         child: DottedBorder(
//           color: Colors.grey,
//           strokeWidth:2.0 ,
//           child:Container(
//             height: 45.0,
//             width: 350.0,
//             child: Padding(
//               padding:  const EdgeInsetsDirectional.only(
//                 start: 105.0,
//               ),
//               child: Row(
//                 children:
//                 [
//                   Icon(
//                     Icons.car_crash_sharp,
//                     size: 25.0,
//                     color: Colors.teal,
//                   ),
//                   SizedBox(
//                     width: 5.0,
//                   ),
//                   Text(
//                       '12 km',
//                     style: TextStyle(
//                       color: Colors.deepOrange,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           borderType: BorderType.RRect,
//           radius: Radius.circular(10),
//           dashPattern: [4,4],
//
//         ),
//       ),
//       const SizedBox(
//         height: 15.0,
//       ),
//
//
//
//     ],
//   );
// }
