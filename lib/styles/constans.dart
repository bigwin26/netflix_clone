import 'package:flutter/material.dart';

const kTextDecoration = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  labelText: '',
  labelStyle: TextStyle(color: Color(0xff8c8c8c)),
  hintStyle: TextStyle(color: Color(0xff8c8c8c)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border:InputBorder.none,
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Colors.orange, width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color:Color(0xff333333), width: 1.0),
  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
  // ),
  // filled: true,
  // fillColor: Color(0xff333333),
);
