import 'package:flutter/material.dart';

const lightGreyColor = Color(0xFFc1c1c7);
const mainDarkColor = Color(0xFF3D3950);
const buttonColor = Color(0xff025A97);

const textFieldInputDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    color: lightGreyColor,
  ),
  filled: true,
  hoverColor: Colors.white,
  fillColor: Colors.white,
  hintText: '',
  hintStyle: TextStyle(
    color: lightGreyColor,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
);

const backgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff005C97), Color(0xff363795)],
);
