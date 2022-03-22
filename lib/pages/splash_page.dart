// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/main_page.dart';
import 'package:flutter_app/pages/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/theme.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences_android/shared_preferences_android.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var sessionIdnew = 'foo';
  @override
  void initState() {
    // TODO: implement initState
    postRequest();
    super.initState();
  }
  //Check SessionId Config
  Future<http.Response> postRequest () async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('sessionIdnew')!=null){
      sessionIdnew = prefs.getString('sessionIdnew')!;
    }

    print('session:' + sessionIdnew);
    var url = Uri.parse("http://api.smartcarecenter.id/api/Account/Config");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'sessionId': 'sessionIdnew',
      'ver': '1.5.6',
    });
    print('body:'+body);
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      String status = data['status'];
      if (status=='OK'){
        Navigator.pushReplacement(context,  MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
        print("${data['sessionExpired']}");
      }else{
        Navigator.pushReplacement(context,  MaterialPageRoute(
          builder: (context) => SignInPage(),
        ));

        print("${data['status']}");
      }
      // UserModel user = UserModel.fromJson(data['user']);
      // user.token = 'Bearer ' + data['access_token'];

      return response;
    } else {
      throw Exception('Check connection');
    }
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logonotif.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
