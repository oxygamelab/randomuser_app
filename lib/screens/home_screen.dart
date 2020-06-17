import 'package:flutter/material.dart';
import 'package:randomuser_app/screens/user_screen.dart';
import 'package:randomuser_app/services/api_service.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> _users;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _initUsers();
  }

  _initUsers() async {
    List<User> users = await APIService.instance.fetchUsers();
    setState(() {
      _users = users;
    });
  }

  _buildUser(User user) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UserScreen(
            name: user.name,
            email: user.email,
            phone: user.phone,
            picture: user.picture,
            nation: user.nation,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1.0),
              blurRadius: 6.0,
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 34.0,
              backgroundImage: NetworkImage(user.thumb),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: _users != null
          ? ListView.builder(
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = _users[index];
                return _buildUser(user);
              },
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
    );
  }
}
