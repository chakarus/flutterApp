import 'package:fami_food_app/models/produitModel.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/cart_page.dart';
import 'package:fami_food_app/screen/categories.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DetailsMenuPage2 extends StatefulWidget {

  final String name;
  final String image;
  final double price;
  final String bigDesc;
  final String litleDesc;
  final String boissonsName;
  final String boissonsImage;

  DetailsMenuPage2({this.image ,this.name,this.price,this.bigDesc,this.litleDesc,this.boissonsImage,this.boissonsName}) ;

  @override
  _DetailsMenuPageState2 createState() => _DetailsMenuPageState2();
}

class _DetailsMenuPageState2 extends State<DetailsMenuPage2> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    List<ProduitModel> produitList=[];
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading:
          IconButton(icon: Icon(
              Icons.arrow_back,
              color: Colors.white),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));},),
        ),
        body: Column(
          children: [
            Expanded(child: Container(
                child:CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage(widget.image),
                )
            )),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color(0xff3a3e3e)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      widget.litleDesc,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.remove, color: Colors.black),
                                onPressed: (){
                                  setState(() {
                                    if(quantity>1){
                                      quantity-=1;
                                    }
                                  });

                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(quantity.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add, color: Colors.black),
                                onPressed: (){
                                  setState(() {
                                    quantity+=1;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Text((widget.price * quantity).toStringAsFixed(2),
                            style: TextStyle(fontSize: 25, color: Colors.white))
                      ],
                    ),
                    Row(
                      children: [
                        Text(" Boissons choisis : ${widget.boissonsName}",style: TextStyle(fontSize: 20, color: Colors.red)),
                        SizedBox(width:10),
                        CircleAvatar(backgroundImage: AssetImage(widget.boissonsImage),)
                      ],
                    ),

                    Text("Description",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text(
                      widget.bigDesc
                      ,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.ajouterAuPanier(ProduitModel(image: widget.image, name: widget.name, price: widget.price, quantity: quantity,boissons:widget.boissonsName));
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => CartPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Color(0xff2b2b2b)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              "Ajouter au Panier",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}