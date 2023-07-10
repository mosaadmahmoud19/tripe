import 'package:flutter/material.dart';

BoxDecoration customBuildBoxDecoration({
  required double? dx,
  required double? dy ,
  double? TLeft = 0,
  double? TRight = 0,
  double? BLeft = 0,
  double? BRight = 0,
}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(BRight!),
        bottomLeft: Radius.circular(BLeft!),
        topLeft: Radius.circular(TLeft!),
        topRight: Radius.circular(TRight!)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(dx!, dy!), // changes position of shadow
      ),
    ],
  );
}