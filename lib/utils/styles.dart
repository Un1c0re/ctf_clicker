import 'package:flutter/material.dart';

InputDecoration flagField = const InputDecoration(
  floatingLabelStyle: TextStyle(
    color: Colors.white,
  ),
  isCollapsed: true,
  contentPadding: EdgeInsets.all(20),
  filled: true,
  fillColor: Colors.transparent,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
