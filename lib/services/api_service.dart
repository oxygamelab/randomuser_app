import 'dart:convert';
import 'dart:io';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService._instantiate();
  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'randomuser.me';

  Future<List<User>> fetchUsers() async {
    Map<String, String> params = {
      'results': '10',
      'gender': 'female',
    };

    Uri uri = Uri.https(_baseUrl, '/api/', params);

    Map<String, String> headers = {
      HttpHeaders.connectionHeader: 'application/json',
    };

    //Get users
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> jsonUsers = data['results'];
      List<User> users = [];
      jsonUsers.forEach(
        (json) => users.add(
          User.fromMap(json),
        ),
      );
      return users;
    } else {
      throw jsonDecode(response.body)['error'];
    }
  }
}
