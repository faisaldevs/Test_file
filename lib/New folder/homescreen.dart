import 'package:flutter/material.dart';

import 'loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                context = context;
                return const Loading();
              },
            );
          },
          child: Container(
            height: 40,
            width: 120,
            color: Colors.orange,
            child: Center(
              child: Text("Show Loading"),
            ),
          ),
        ),
      ),
    );
  }
}
