// import 'package:flutter/material.dart';
//
// import '../../data/gender_list_data.dart';
//
// class CustomDropdown extends StatefulWidget {
//
//    const CustomDropdown({super.key});
//
//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }
//
// class _CustomDropdownState extends State<CustomDropdown> {
//   @override
//   Widget build(BuildContext context) {
//
//    var genderListData = GenderList.genderListData;
//
//     List<String> _genderList = genderListData;
//     String dropdownValue = "";
//
//     myFormState() {
//       dropdownValue = _genderList[0];
//     }
//
//     return DropdownButton(
//       isExpanded: true,
//       value: dropdownValue,
//       icon: const Icon(Icons.keyboard_arrow_down_outlined),
//       items: _genderList.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (val) {
//         setState(() {
//           dropdownValue = val!;
//         });
//       },
//     );
//   }
// }
import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Future<List<ModelDart>> getPost() async {
    try {
      final response = await http
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      final body = json.decode(response.body) as List;

      if (response.statusCode == 200) {
        final map = e as Map<String, dynamic>;

        return body.map((e) {
          return ModelDart(id: map["id"]);
        }).toList();
      }
    } catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint: const Text("select one"),
        items: const [
          DropdownMenuItem(value: 1, child: Text("faisal")),
          DropdownMenuItem(value: 2, child: Text("fa")),
          DropdownMenuItem(value: 3, child: Text("fal")),
          DropdownMenuItem(value: 4, child: Text("u")),
          DropdownMenuItem(value: 5, child: Text("c")),
        ],
        onChanged: (value) {});
  }
}

// dropDownList.map((e) {
// return DropdownMenuItem(
// value: e,
// child: Text(
// e,
// style: const TextStyle(fontWeight: FontWeight.normal),
// ));
// }).toList()

// InputDecoration decoration = const InputDecoration(
//   labelText: ,
//   border: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.black,
//         width: 1,
//       )),
//   hintText: "enter your custom hint text here",
// );
