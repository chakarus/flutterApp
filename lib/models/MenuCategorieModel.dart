import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:flutter/material.dart';


class MenuCategoriesModel{
  final String image;
  final String name;
  final double price;
  final String bigDesc;
  final String litleDesc;
  final FoodCategoriesModel boissons;

  MenuCategoriesModel({@required this.image,@required this.name,@required this.price,@required this.bigDesc,@required this.litleDesc,this.boissons});

}