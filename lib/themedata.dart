import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    fixedSize: Size.fromWidth(double.maxFinite),
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide.none,
    )

  );

  static InputDecoration textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,

    ),
    floatingLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
    ),
    //floatingLabelAlignment: FloatingLabelAlignment.start,
    //floatingLabelBehavior: FloatingLabelBehavior.auto,// this is used for floating label always active or active when i click on text field
    contentPadding: EdgeInsets.all(12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.green),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.yellow),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red),
    ),
  );
}
