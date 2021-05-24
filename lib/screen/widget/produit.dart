import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Produit extends StatefulWidget {
  final String imageName;
  final String libelleName;
  final String boissons;
  final Function ontapPlus;
  final Function ontapMoins;
  final Function remove;
  final double price;
  int quantity;

  Produit({this.imageName, this.libelleName, this.price, this.quantity,this.ontapPlus,this.ontapMoins,this.remove,this.boissons});

  @override
  _ProduitState createState() => _ProduitState();
}

class _ProduitState extends State<Produit> {
  int nombre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2.1,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.imageName),
                )),
            SizedBox(width: 20),
            Expanded(
              child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: widget.remove),
                Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.libelleName,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Text('description',
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                        widget.boissons!=null?Text(widget.boissons,style:TextStyle(color:Colors.white)):Text(""),
                        Text(widget.price.toStringAsFixed(2),
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                icon: Icon(Icons.remove_circle_outline,
                                    color: Colors.white),
                                iconSize: 30,
                                onPressed: widget.ontapMoins),
                            Text(widget.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            IconButton(
                                icon: Icon(Icons.add_circle_outline,
                                    color: Colors.white),
                                iconSize: 30,
                                onPressed: widget.ontapPlus),
                          ],
                        )
                      ],
                    ))),
              ]),
            )
          ],
        )
      ],
    );
  }
}
