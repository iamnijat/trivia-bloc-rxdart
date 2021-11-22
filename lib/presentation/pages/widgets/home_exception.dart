import 'package:flutter/material.dart';

Widget buildErrorWidget(String error) {
  return const Padding(
    padding: EdgeInsets.only(left: 40, right: 40),
    child: Text(
      "Check your internet connection or some errors on your device",
      style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
          color: Colors.black),
      textAlign: TextAlign.center,
    ),
  );
}
