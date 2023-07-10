

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  bool isPassword = false,
  required Function validate,
  required String label,
   String? hintText,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,

}) =>
    TextFormField(

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (value)
      {
        onSubmit!(value);
      },

      validator: ( value)
      {
        return validate(value);
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.teal,
        ),
        prefixIconColor: Colors.teal,
        suffixIcon: suffix != null ? IconButton(
          onPressed: ()
          {
            suffixPressed!();

          },
          icon: Icon(
            suffix,
            color: Colors.teal,
          ),
        ) : null,
        hintText: hintText ,
        hintStyle: TextStyle(
          color: Colors.teal,
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
          borderSide: BorderSide(color: Colors.teal),
        ),
        constraints: BoxConstraints(
          minHeight: 1.0,
        ),


      ),


    );

Widget defaultTextButton({
   required String textName,
   required Color primaryColor,
   required Color backgroundColor,
   required Function function,

}) =>
TextButton(
  style: TextButton.styleFrom(
  primary: primaryColor,
  backgroundColor: backgroundColor,

  minimumSize: Size(350, 60),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  ),
  onPressed:()
  {
    function();
  },
  child: Text(textName),
);

Widget signUpTextButton({
  required String textName,
  required Color primaryColor,
  required Color backgroundColor,
  required String image,
  required Function function,
}) =>
    TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey, width: 1),
        minimumSize: Size(350, 60),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed:()
      {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Image(
            image: AssetImage(image),
            height: 20.0,
            width: 20.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(textName),

        ],
      ),
    );

void showToast({
   String? text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );
