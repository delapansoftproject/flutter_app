import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/main_page.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/widgets/loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:shared_preferences_android/shared_preferences_android.dart';
import '../providers/auth_provider.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');
  // getSession() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('sessionIdnew', '65655+65');
  // }
  bool isLoading = false;
  Future<http.Response> postsignin () async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse("http://api.smartcarecenter.id/api/Account/Login");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': emailController.text,
      'password': passwordController.text,
      'firebaseToken': '132',
      'ver': '1.5.6',
    });
    print(body);
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      var data = jsonDecode(response.body);

      String status = data['status'];

      if (status=='OK'){
        Navigator.pushReplacement(context,  MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
        print("${data['sessionExpired']}");
        // var session = jsonDecode(data['data']);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('sessionIdnew', data['data']['sessionId']);
        print(prefs.getString('sessionIdnew'));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              data['errorMessage'],
              textAlign: TextAlign.center,
            ),
          ),
        );
        // Navigator.pushReplacement(context,  MaterialPageRoute(
        //   builder: (context) => SignInPage(),
        // ));

        print("${data['status']}");
      }
      return response;
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Check connection');
    }
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  _launchURL() async {
    const url = 'https://www.tokopedia.com/bigberry888/iphone-12-pro-12-pro-max-128gb-256gb-512gb-bekas-mulus-fullset-ori-12-pro-128gb';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {

    //header
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In to Continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }
    //email
    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    //password
    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    //button
    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: postsignin,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          // onPressed: () {  },
          child: Text(
            'Sign In',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }
    //footer
    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
               _launchURL();
              },
              child: Text(
                'Sign Up',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    //return tampilan widget
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                emailInput(),
                passwordInput(),
                isLoading ? LoadingButton() : signInButton(),
                Spacer(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
