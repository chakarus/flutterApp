import 'dart:io';

import 'package:fami_food_app/admin/OrderPage.dart';
import 'package:fami_food_app/admin/categorieAdminPage.dart';
import 'package:fami_food_app/admin/productAdminPage.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/Payement.dart';
import 'package:fami_food_app/screen/cart_page.dart';
import 'package:fami_food_app/screen/choixBoissonsPage.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:fami_food_app/screen/login_page.dart';
import 'package:fami_food_app/screen/sign_up.dart';
import 'package:fami_food_app/screen/welcome_page.dart';
import 'package:fami_food_app/screen/details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/login_page.dart';
import 'screen/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'fami_food_app',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2b2b2b),
            appBarTheme: AppBarTheme(color: Color(0xff2b2b2b))),

         // home:OrderPage()

        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            sleep(Duration(seconds: 2));
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return Login_Page();
            }
          },
        ),
      ),
    );
  }
}
