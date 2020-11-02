import 'package:flutter/material.dart';

Widget Textinput(TextEditingController controller, String hint) {
  return TextField(
    textAlign: TextAlign.center,
    controller: controller,
    style: TextStyle(fontSize: 20, color: Colors.black),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(153, 155, 158, 1),
      ),
      hintText: hint,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
    ),
  );
}
