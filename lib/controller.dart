import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetTheData extends GetxController{
  List<dynamic> data = [];

 Future getData() async{
    print("pressed...");

    try{
     String apiUrl = "https://starsoftjpn.xyz/api/v1/division";

      var response = await http.get(Uri.parse(apiUrl));

     if(response.statusCode == 200){
       print("succeed....");

       var body = response.body;
       print(body.toString());

       final json = jsonDecode(body);

      data = json["data"];

       print("data : "+ data.toString());


     }


    }catch(e){
     print(e);
    }

  }

}