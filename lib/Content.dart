import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_connect_server/TextField.dart';
import 'package:http/http.dart' as http;
import 'package:open_connect_server/home.dart';

String hintText;

String hintTextreturn() {
  return hintText;
}

Widget Content() {
  HomeState home = HomeState();
  TextEditingController SarchController = TextEditingController();
  SarchController.text = hintText;
  SarchController.addListener(() {
    hintText = SarchController.text;
  });
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Textinput(SarchController, "Введите адресс"),
      ),
    ],
  );
}
