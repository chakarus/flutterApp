import 'package:flutter/material.dart';
class CardModel{

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool showBackview;

  CardModel({this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode, this.showBackview});
}