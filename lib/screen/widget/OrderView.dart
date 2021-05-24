import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  final List commandName;
  final Timestamp date;
  final bool etatCommande;
  final List produitList;
  final double total;

  const OrderView(
      {this.commandName,
      this.date,
      this.etatCommande,
      this.produitList,
      this.total});

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:Axis.horizontal,
      child: Column(children: [
        Text(widget.date.toDate().toString(), style: TextStyle(fontSize: 15)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: widget.commandName
                .map((e) => Row(
                      children: [
                        Text(
                          e.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 20),
                      ],
                    ))
                .toList(),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: widget.produitList.map((e) => Text(e.toString(),style: TextStyle(fontSize: 15),)).toList()
            ),


          ],
        ),

        widget.etatCommande
            ? Text("payé", style: TextStyle(color: Colors.white, fontSize: 15))
            : Text("en attente",
                style: TextStyle(color: Colors.white, fontSize: 15)),

        // ListView.builder( itemCount: widget.produitList.length,
        //     itemBuilder:(context,index){
        //       return Column(
        //           children:[Text(widget.produitList[index].toString())]);
        //     }),
        Text(
          widget.total.toStringAsFixed(2),
          style: TextStyle(fontSize: 15),
        ),
      ]),
    );
  }
}
