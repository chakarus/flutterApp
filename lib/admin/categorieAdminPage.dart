
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/screen/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorieAdminPage extends StatefulWidget{
  @override
  _CategorieAdminPageState createState() => _CategorieAdminPageState();
}

class _CategorieAdminPageState extends State<CategorieAdminPage> {

  TextEditingController categorie = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back)),),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Admin Categorie Page",style:TextStyle(fontSize: 30,color: Colors.white)),
          My_Text_Field(name: "new cate", controller: categorie,obscureText: false,),
          ElevatedButton(onPressed: (){FirebaseFirestore.instance.collection("foodcategories").doc("SRatsvFHZvaAn8gDzIXc").collection(categorie.text.trim()).add({"fscs":"25"});}, child: Text("Ajouter",style:TextStyle(fontSize: 30,color: Colors.white)))

        ],
      )

    );
  }
}