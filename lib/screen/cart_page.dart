import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:fami_food_app/models/OrderListProduitModel.dart';
import 'package:fami_food_app/models/OrderModel.dart';
import 'package:fami_food_app/models/UserModel.dart';
import 'package:fami_food_app/models/produitModel.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/Payement.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:fami_food_app/screen/widget/produit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  OrderModel order;
  UserModel user;

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    List<ProduitModel> productList = [];
    List listing = [];
    productList = provider.produitList;
    bool etatCommande = false;
    double total = provider.totalfunc();
    provider.getUser();
    user = provider.throwUser;


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
      ),
      body: ListView.builder(
          itemCount: provider.produitList.length,
          itemBuilder: (ctx, index) {
            if (provider.produitList[index].boissons == null) {
              return Produit(
                imageName: provider.produitList[index].image,
                libelleName: provider.produitList[index].name,
                price: provider.produitList[index].price,
                quantity: provider.produitList[index].quantity,
                ontapMoins: () {
                  setState(() {
                    if (provider.produitList[index].quantity > 1)
                      provider.produitList[index].quantity--;
                  });
                },
                ontapPlus: () {
                  setState(() {
                    provider.produitList[index].quantity++;
                  });
                },
                remove: () {
                  setState(() {
                    provider.produitList.remove(provider.produitList[index]);
                  });
                },
              );
            } else {
              return Produit(
                imageName: provider.produitList[index].image,
                libelleName: provider.produitList[index].name,
                price: provider.produitList[index].price,
                quantity: provider.produitList[index].quantity,
                boissons: provider.produitList[index].boissons,
                ontapMoins: () {
                  setState(() {
                    if (provider.produitList[index].quantity > 1)
                      provider.produitList[index].quantity--;
                  });
                },
                ontapPlus: () {
                  setState(() {
                    provider.produitList[index].quantity++;
                  });
                },
                remove: () {
                  setState(() {
                    provider.produitList.remove(provider.produitList[index]);
                  });
                },
              );
            }
          }),
      bottomNavigationBar: GestureDetector(
        onTap: () async{
          for (int i = 0; i < provider.produitList.length; i++) {
            listing.add(({
              "name": provider.produitList[i].name,
              "price": provider.produitList[i].price,
              "quantity": provider.produitList[i].quantity,
            }));
          }

          await FirebaseFirestore.instance.collection("order").add({
            "date":Timestamp.now(),
            "list": listing,
            "commandName": [user.firstName, user.lastName, user.email],
            "etatCommande": etatCommande,
            "total":total
          });
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Payement()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          height: 70,
          color: Color(0x7C758784),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${total.toStringAsFixed(2)} €",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              Text("Commandez",
                  style: TextStyle(fontSize: 25, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makeOrder()  {

  }
}
