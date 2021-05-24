import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/models/produitAdminModel.dart';
import 'package:fami_food_app/screen/widget/my_text_field.dart';
import 'package:fami_food_app/screen/widget/uploadFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductAdminPage extends StatefulWidget{
  @override
  _ProductAdminPageState createState() => _ProductAdminPageState();
}

class _ProductAdminPageState extends State<ProductAdminPage> {
  @override
  Widget build(BuildContext context) {
   

    File file;
     void filePicking()async{
       PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
       file = File(pickedFile.path);
       print(file.absolute);


    }

    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    TextEditingController name = TextEditingController();
    TextEditingController image = TextEditingController();
    // TextEditingController imageFile = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController categorie = TextEditingController();
    TextEditingController bigdesc = TextEditingController();
    TextEditingController litledesc = TextEditingController();

    Future sendData()async{
      await FirebaseFirestore.instance
          .collection('foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection(categorie.text.trim())
          .add({
        'name': name.text.trim(),
        'image':image.text.trim(),
        "price":double.parse(price.text.trim()),
        "bigdesc":bigdesc.text.trim(),
        "litledesc":litledesc.text.trim()
      });
    }

    void validation(){
      if(categorie.text.trim().isEmpty || categorie.text.trim() ==  null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ categorie ne peut pas etre vide")));
      }
      if(name.text.trim().isEmpty || name.text.trim() ==  null){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ name ne peut pas etre vide")));
      }
      if(image.text.trim().isEmpty || image.text.trim() ==  null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ ne peut pas etre vide")));
      }
      if(price.text.trim().isEmpty || price.text.trim() ==  null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ ne peut pas etre vide")));
      }
      if(bigdesc.text.trim().isEmpty || bigdesc.text.trim() ==  null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ ne peut pas etre vide")));
      }
      if(litledesc.text.trim().isEmpty || litledesc.text.trim() ==  null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("le champ ne peut pas etre vide")));
      }
      else{
        sendData();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ajouter avec succes")));
      }
    }


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back)),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Admin Produit Page",style:TextStyle(fontSize: 35,color:Colors.white)),
          My_Text_Field(name: "categorie", controller: categorie,obscureText: false,),
          My_Text_Field(name: "name", controller: name,obscureText: false,),
          UploadFile(onpressed: filePicking,),
          My_Text_Field(name: "image", controller: image,obscureText: false,),
          My_Text_Field(name: "price", controller: price,obscureText: false,),
          My_Text_Field(name: "bigdesc", controller: bigdesc,obscureText: false,),
          My_Text_Field(name: "litledesc", controller: litledesc,obscureText: false,),
          Container(
            width:MediaQuery.of(context).size.width/2,
            height:50,
            child: ElevatedButton(
                onPressed: (){
                 validation();
                },
                child:Text("Validez",style:TextStyle(fontSize: 25,color: Colors.white)),
              style: ButtonStyle(),
            ),
          )
        ],
      )


    );
  }
}