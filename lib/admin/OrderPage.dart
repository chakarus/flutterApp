import 'package:fami_food_app/models/OrderModel.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/widget/OrderView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<OrderModel> orderList = [];

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getAllOrder();
    orderList = provider.throwOrderList;

    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 3,
              color: Colors.blueGrey,
            ),
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return OrderView(
              commandName: orderList[index].commandName,
              date: orderList[index].date,
              etatCommande: orderList[index].etatCommande,
              produitList: orderList[index].productList,
              total: orderList[index].total);
        });
  }
}
