
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDetailCate extends StatelessWidget{

  final String textImage;
  final String textLibelle;
  final double price;
  final String bigDesc;
  final String litleDesc;
  final Function ontap;

  MyDetailCate({@required this.textImage, @required this.textLibelle, @required this.price,@required this.ontap,this.bigDesc,this.litleDesc});

  @override
  Widget build(BuildContext context) {
   return

        GestureDetector(
          onTap: ontap,
          child: Container(

           margin:EdgeInsets.only(left:10,bottom: 15),
           height: 250,
           width: MediaQuery.of(context).size.width / 2.3,
           decoration: BoxDecoration(
             color: Color(0xff1a94ac),
             borderRadius: BorderRadius.circular(20),
             boxShadow: [
               BoxShadow(
                 color: Colors.black,
                 offset: Offset(1.0, 6.0),
                 blurRadius: 20.0,
               ),
             ]
           ),
           child: Column(
             children: [
               CircleAvatar(
                 backgroundImage: AssetImage(textImage),
                 radius: 50,
                 backgroundColor: Colors.white,

               ),
               SizedBox(height:10),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Row(children: [
                   Text(textLibelle,
                       style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold ,fontStyle: FontStyle.italic)),
                 ],),
               ),
               ListTile(

                 trailing: Text(
                   "${price.toStringAsFixed(2)} €",
                   style: TextStyle(color: Colors.black, fontSize: 20,fontWeight:FontWeight.bold ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left:10.0),
                 child: Row(
                   children: [
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                   ],
                 ),
               )
             ],
           ),


     ),
        );
  }

}