import 'package:flutter/material.dart';


class FoodCategoriesModel{
  final String image;
  final String name;
  final double price;
  final String bigDesc;
  final String litleDesc;
  final FoodCategoriesModel boissons;

  FoodCategoriesModel({@required this.image,@required this.name,@required this.price,@required this.bigDesc,@required this.litleDesc,this.boissons});

}