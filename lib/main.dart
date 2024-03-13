import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'DivisionModel.dart';
import 'controller.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = PostHttpOverrides();

  runApp(MaterialApp(home: DropdownModel()));
}

class DropdownModel extends StatefulWidget {
  const DropdownModel({super.key});

  @override
  State<DropdownModel> createState() => _DropdownModelState();
}

class _DropdownModelState extends State<DropdownModel> {
  List<dynamic> data = [];

  Future<List<DivisionModel>> getData() async {
    print("pressed...");

    try {
      String apiUrl = "https://starsoftjpn.xyz/api/v1/division";

      var response = await http.get(Uri.parse(apiUrl));
      var body = response.body;
      final json = jsonDecode(body);

      data = json["data"] as List;

      if (response.statusCode == 200) {
        print(data);

        return data.map((e) {
          final map = e as Map<String, dynamic>;
          return DivisionModel(
            id: map["id"],
            division: map["division"],
          );
        }).toList();
      }
    } catch (e) {
      print(e);
    }
    throw "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<List<DivisionModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(40),
                child: DropdownButton(
                  isExpanded: true,
                  items: snapshot.data?.map((e) {
                    return DropdownMenuItem(child: Text(e.division.toString()),value: e.id,);
                  } ).toList(),
                  onChanged: (value) {},
                  hint: Text("Select Item"),
                ));
          }
          {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
