// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/main_page.dart';
import 'package:flutter_app/pages/sign_in_page.dart';
import 'package:flutter_app/providers/auth_provider.dart';
import 'package:flutter_app/providers/page_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_app/pages/home/main_page.dart';
// import 'package:flutter_app/pages/sign_in_page.dart';
import 'package:flutter_app/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          // '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          // '/edit-profile': (context) => EditProfilePage(),
          // '/cart': (context) => CartPage(),
          // '/checkout': (context) => CheckoutPage(),
          // '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
