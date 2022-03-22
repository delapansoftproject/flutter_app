import 'dart:convert';

import 'package:flutter_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://api.smartcarecenter.id/api/Account';

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/Login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': email,
      'password': password,
      'firebaseToken': 'dnNJV3UKp9Y:APA91bHTOVPG50oJ33MabDl9zQcquAPy8M4aISS11FWh0WwnH7dmsrpUKAIcHVxh5zxg15VRM7McEUaeSnSHHp-EpET3O_ZyBDoorlB6riM1BMA3-eCxuPmqcINq4vksE3HNgmHuzFpp',
      'ver': '1.5.2',
    });
    print(body);
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> config({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/Login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': email,
      'password': password,
      'firebaseToken': 'dnNJV3UKp9Y:APA91bHTOVPG50oJ33MabDl9zQcquAPy8M4aISS11FWh0WwnH7dmsrpUKAIcHVxh5zxg15VRM7McEUaeSnSHHp-EpET3O_ZyBDoorlB6riM1BMA3-eCxuPmqcINq4vksE3HNgmHuzFpp',
      'ver': '1.5.2',
    });
    print(body);
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
