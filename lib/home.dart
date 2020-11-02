import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_connect_server/Content.dart';
import 'package:http/http.dart' as http;
import 'package:open_connect_server/sortMap.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

Map result = {};
String text = "";
Future<Map<String, dynamic>> fetchUser() async {
  //return Future.delayed(Duration(seconds: 5), () => {'id': userId.toString(), 'name': 'Max'});
  String url = 'http://mainnet-gate.decimalchain.com/api/address/' +
      hintTextreturn() +
      '?txLimit=100';
  print(url);
  var response = await http.get(url);
  Map list = (json.decode(response.body) as Map);
  return list;
}

class HomeState extends State<Home> {
  TextEditingController SarchController = TextEditingController();
  void useFuter2() async {
    print('Connect server...');
    try {
      result = await fetchUser();
      text = Sortmap(result);
      setState(() {});
      print('exit code 0');
    } catch (e) {
      print(e);
      text = "error";
      setState(() {});
      print("error conenct server:");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Content(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  useFuter2();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                  width: 160,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Найти данные",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                text,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
