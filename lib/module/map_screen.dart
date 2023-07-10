import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trip_app/layout/cubit/cubit.dart';
import 'package:trip_app/layout/cubit/states.dart';
import 'package:trip_app/models/app_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});






  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TriperAppCubit, TriperAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(

          body: Stack(
            children: [
              FlutterMap(
                mapController: TriperAppCubit.get(context).mapController,
                options: MapOptions(
                  minZoom: 5,
                  maxZoom: 18,
                  zoom: 20,
                  center:  LatLng(TriperAppCubit.get(context).currentPosition?.latitude ??31.096509 , TriperAppCubit.get(context).currentPosition?.longitude ??30.949624),
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    "https://api.mapbox.com/styles/v1/momenrizq/clinsstm300ox01r0gb7083zv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibW9tZW5yaXpxIiwiYSI6ImNsaTV4NWIxYTM2a3kza250YWQwZjRlbmkifQ.XuQulU-DCape4YKZ16MpxQ",
                    additionalOptions: {
                      'mapStyleId': AppConstants.mapBoxStyleId,
                      'accessToken': AppConstants.mapBoxAccessToken,
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 30.0,
                        height: 30.0,
                        point: TriperAppCubit.get(context).currentLocation,
                        builder: (ctx) => Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                child: TextField(
                  controller: TriperAppCubit.get(context).searchController,
                  decoration: InputDecoration(
                    hintText: 'Search city',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed:() => {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  }






