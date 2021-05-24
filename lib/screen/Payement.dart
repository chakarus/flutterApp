import 'package:fami_food_app/screen/Existing_Cards.dart';
import 'package:fami_food_app/service/Payement_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payement extends StatefulWidget {
  @override
  _PayementState createState() => _PayementState();
}

class _PayementState extends State<Payement> {

  onItemPress(BuildContext context, int index) {
    switch (index) {
      case 0:
        StripTransactionResponse response = StripeService.payWithNewCard(
          amount: 120.0,
          currency: "USD",);
        if (response.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response.message)));
        }
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => Existing_Cards()));
        break;
    }
  }


@override
Widget build(BuildContext context) {
  ThemeData theme = Theme.of(context);
  return Scaffold(
      appBar: AppBar(
          title: Text("Home")
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                Icon icon;
                Text text;

                switch (index) {
                  case 0:
                    {
                      icon = Icon(Icons.add_circle, color: theme.primaryColor);
                      text = Text("payer avec une nouvelle carte",
                          style: TextStyle(fontSize: 17, color: Colors.white));
                    }
                    break;
                  case 1:
                    {
                      icon = Icon(Icons.credit_card, color: theme.primaryColor);
                      text = Text("payer avec une carte existante",
                          style: TextStyle(fontSize: 17, color: Colors.white));
                    }
                    break;
                }
                return InkWell(
                    onTap: () {
                      onItemPress(context, index);
                    },
                    child: ListTile(
                      title: text,
                      leading: icon,

                    )
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(
                    color: Colors.red,
                    height: 40,
                    thickness: 2,
                  ),
              itemCount: 2)
      )


  );
}}
