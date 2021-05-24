import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:fami_food_app/models/boissonsModel.dart';
import 'package:fami_food_app/models/produitModel.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/DetailsMenuPage2.dart';
import 'package:fami_food_app/screen/cart_page.dart';
import 'package:fami_food_app/screen/categories.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChoixBoissonsPage extends StatefulWidget {

  final String name;
  final String image;
  final double price;
  final String bigDesc;
  final String litleDesc;

  ChoixBoissonsPage({this.image ,this.name,this.price,this.bigDesc,this.litleDesc}) ;


  @override
  _ChoixBoissonsPageState createState() => _ChoixBoissonsPageState();
}

class _ChoixBoissonsPageState extends State<ChoixBoissonsPage> {
  String dropdownValue ;
  String hintText = "Choisir Boisson";
  List<FoodCategoriesModel> boissonsList;
  BoissonModel boiss;

  FoodCategoriesModel boissons;
  String imageBoissons;
  String defaultImage = "images/cocacola.jpg";

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getBoissonsCategoriesList();
    boissonsList = provider.throwBoissonsCategoriesList;

    return Scaffold(
        appBar: AppBar(
            leading:
                IconButton(onPressed:(){Navigator.pop(context);},icon: Icon(Icons.arrow_back, color: Colors.white))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: DropdownButton(
                  hint: Text(
                    hintText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  dropdownColor: Colors.grey,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.red),
                  underline: Container(
                    height: 2,
                    color: Colors.red,
                  ),
                  onChanged: (List newValue) {
                    setState(() {
                      dropdownValue = newValue[0];
                      hintText = newValue[0];
                      imageBoissons = newValue[1];
                    });
                  },
                  items: boissonsList.map((e) {
                    boissons = e;

                    return DropdownMenuItem(
                      value: [e.name, e.image],
                      child: Text(
                        e.name,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    );
                  }).toList(),
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  imageBoissons != null ? imageBoissons : defaultImage,
                ),
                radius: 80,
              ),
              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // boiss.image = dropdownValue;
                    // boiss.name = imageBoissons;
                    //  provider.ajouterBoissonsMenu(boiss);
                    if(dropdownValue != null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => DetailsMenuPage2(
                          name:widget.name,
                          image:widget.image,
                            price:widget.price,
                          bigDesc:widget.bigDesc,
                          litleDesc: widget.litleDesc,
                          boissonsImage: imageBoissons,
                          boissonsName: dropdownValue,


                        )));}else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1) ,content: Text("veuillez choisir une boisson ",style:TextStyle(color:Colors.red,fontSize: 20))));
                    }

                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Color(0xFFFA7704)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward_outlined),
                      Text(
                        "Continuez",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
