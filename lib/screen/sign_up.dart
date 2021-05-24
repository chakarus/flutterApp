import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:fami_food_app/screen/login_page.dart';
import 'package:fami_food_app/screen/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/my_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();




  Future sendData() async {
    try {
      UserCredential userCredential =  await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      await FirebaseFirestore.instance.collection('userData').doc(userCredential.user.uid).set({
        "firstName":firstName.text.trim(),
        "lastName":lastName.text.trim(),
        "email":email.text.trim(),
        "userId":userCredential.user.uid,
        "password":password.text.trim()

      });






      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login_Page()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("le mot de passe fourni est trop faible.")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("un compte éxiste déja pour cet email.")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
      setState(() {
        loading=false;
      });
    }
    setState(() {
      loading=false;
    });
  }

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('veuillez entrer votre nom')));
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez entrer votre nom d'utilisateur")));
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez entrer votre adresse email")));
    } else if (regExp.hasMatch(email.text) != true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez entrer  adresse email correct")));
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("veuillez entrer votre password")));
    }else{
      setState(() {
          loading=true;
      });
      sendData();

    }
    return;
  }

  Widget button(
      {@required String name,
      @required Color button_color,
      @required Color text_color,
      @required Function ontap,
      BuildContext context}) {
    return Container(
        width: MediaQuery.of(context).size.width / 3.2,
        height: 50,
        child: RaisedButton(
          color: button_color,
          onPressed: ontap,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50)),
          child: Text(name, style: TextStyle(color: text_color)),
        ));
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        key: globalKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Inscription",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      My_Text_Field(
                        name: "Nom",
                        obscureText: false,
                        controller: firstName,
                      ),
                      My_Text_Field(
                          name: "Prénom",
                          obscureText: false,
                          controller: lastName),
                      My_Text_Field(
                          name: "Email", obscureText: false, controller: email),
                      My_Text_Field(
                          name: "Mot De Passe",
                          obscureText: true,
                          controller: password),
                    ],
                  ),
                ),
               loading?Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 CircularProgressIndicator()
               ],): Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(
                        ontap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Welcome_Page()));
                        },
                        name: "Annuler",
                        button_color: Colors.grey,
                        text_color: Colors.black,
                        context: context),
                    button(
                        ontap: () {
                           validation();

                        },
                        name: "S'enregistrer",
                        button_color: Colors.red,
                        text_color: Colors.white,
                        context: context)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
