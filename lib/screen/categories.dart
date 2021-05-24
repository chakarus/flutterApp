import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:fami_food_app/screen/choixBoissonsPage.dart';
import 'package:fami_food_app/screen/details_page.dart';
import 'package:fami_food_app/screen/homePage.dart';
import 'package:fami_food_app/screen/widget/MyDetailCate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModel> list = [];

  Categories({@required this.list});

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          children: list
              .map((e) => MyDetailCate(
                    textImage: e.image,
                    textLibelle: e.name,
                    price: e.price,
                    bigDesc: e.bigDesc,
                    litleDesc: e.litleDesc,
                    ontap: () {
                      var i = 0;
                      for (i = 0; i < list.length; i++) {
                        if (list[i].boissons == null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailsPage(
                                        image: e.image,
                                        name: e.name,
                                        price: e.price,
                                        bigDesc: e.bigDesc,
                                        litleDesc: e.litleDesc,
                                      )));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChoixBoissonsPage(

                                        image: e.image,
                                        name: e.name,
                                        price: e.price,
                                        bigDesc: e.bigDesc,
                                        litleDesc: e.litleDesc,

                                      )));
                        }
                      }
                    },
                  ))
              .toList()),
    );
  }
}
