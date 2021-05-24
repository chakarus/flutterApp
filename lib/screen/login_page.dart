import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/sign_up.dart';
import 'package:fami_food_app/screen/welcome_page.dart';
import 'package:fami_food_app/screen/widget/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login_Page extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool loading = false;
  UserCredential userCredential;

  RegExp regExp = RegExp(Login_Page.pattern);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("utilisateur inexistant !")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("mauvais mot de passe !")));
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }catch(e){
      print(e.toString());
    }
  }

  validation() {
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez renseigner votre email!")));
    } else if (regExp.hasMatch(email.text) != true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez entrer  adresse email correct")));
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez renseigner votre password!")));
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Welcome_Page()));
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              Column(
                children: [
                  My_Text_Field(
                      name: "Email", obscureText: false, controller: email),
                  SizedBox(height: 30),
                  My_Text_Field(
                      name: "Mot De Passe",
                      obscureText: true,
                      controller: password)
                ],
              ),
              loading
                  ? CircularProgressIndicator()
                  : Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 60,
                      child: ElevatedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            validation();
                          }),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("pas encore de compte ? ",
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    child: Text(" s'enregistrer",
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignUp()));
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}
