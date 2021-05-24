
import 'package:flutter/cupertino.dart';

class MenuModel{

  final String image;
  final String name;
  final double price;
  final String boissons;
  int quantity = 1;

  MenuModel({@required this.image,@required this.name, @required this.price, @required this.quantity,this.boissons});


}