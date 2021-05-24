import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/models/FoodCategoriesModel.dart';

class OrderModel{

   final List commandName;
   final Timestamp date;
   final bool etatCommande;
   final List productList;
   final double total;

  OrderModel({this.commandName, this.date, this.etatCommande, this.productList, this.total});





}