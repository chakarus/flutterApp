import 'package:fami_food_app/models/CardModel.dart';
import 'package:fami_food_app/service/Payement_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class Existing_Cards extends StatefulWidget{
  @override
  _Existing_CardsState createState() => _Existing_CardsState();
}

class _Existing_CardsState extends State<Existing_Cards> {


  List<CardModel> cardList = [CardModel(cardNumber:"123456789",expiryDate:"04/23",cardHolderName:"kamil",cvvCode:"504",showBackview: false),CardModel(cardNumber:"26581256789",expiryDate:"04/22",cardHolderName:"patrick",cvvCode:"504",showBackview: false)];

  payViaExistinCards(BuildContext context,CardModel card){
    StripTransactionResponse response = StripeService.payWithNewCard(
      amount: 120.0,
      currency: "USD",
    card:card);
    if (response.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message))).closed.then((_) { Navigator.pop(context);});

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Choisir une carte existante")
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child:ListView.builder(
          itemCount: cardList.length,
            itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                payViaExistinCards(context, cardList[index]);
              },
              child: CreditCardWidget(

                cardNumber: cardList[index].cardNumber,
                expiryDate: cardList[index].expiryDate,
                cardHolderName: cardList[index].cardHolderName,
                cvvCode: cardList[index].cvvCode,
                showBackView: cardList[index].showBackview,
               cardBgColor: Colors.blueGrey,
               cardType: CardType.visa,
               //true when you want to show cvv(back) view
              ),
            );

        })
      )


    );
  }
}