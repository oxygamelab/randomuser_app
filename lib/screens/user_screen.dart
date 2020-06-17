import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String picture;

  UserScreen({this.picture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(picture),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
