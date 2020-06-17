import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String picture;
  final String nation;

  UserScreen({
    this.name,
    this.email,
    this.phone,
    this.picture,
    this.nation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'hero',
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                        )
                      ]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100.0,
                    backgroundImage: NetworkImage(picture),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                phone,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                nation,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
