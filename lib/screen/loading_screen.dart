import 'package:flutter/material.dart';
import 'package:flutter_base/service/navigation_service.dart';
import 'package:flutter_base/util/my_router.gr.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Center(child: Text("LoadingScreen")),
          ],
        ),
      )),
    );
  }
}
