import 'package:flutter/material.dart';

const lightGreyColor = Color(0xFFc1c1c7);
const mainDarkColor = Color(0xFF3D3950);
const buttonColor = Color(0xFFb8adf1);

const textFieldInputDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    color: lightGreyColor,
  ),
  filled: true,
  hoverColor: Colors.white,
  fillColor: Colors.white,
  // icon: Icon(
  //   Icons.search,
  //   color: lightGreyColor,
  // ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: lightGreyColor,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
);
