import 'package:fami_food_app/screen/login_page.dart';
import 'package:fami_food_app/screen/sign_up.dart';
import 'package:flutter/material.dart';

class Welcome_Page extends StatelessWidget{

  Widget button({@required String name ,Color color,Color color_text, BuildContext context,Function ontap}){
    return

      Container(
        width:MediaQuery.of(context).size.width/1.5,
        height:55,
        child: RaisedButton(
            color: color,
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side:BorderSide(color:Colors.green)
            ),

            onPressed: ontap,
            child:Text(name,style:TextStyle(fontSize: 20,color: color_text))
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children:<Widget> [
          Expanded(
            child:Container(
              height:MediaQuery.of(context).size.height,
                child:Center(
                    child:Image.asset('images/accueilFami.jpg'),

                )
            )
          ),
          Expanded(
            child:Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("''Bienvenue Au Family Food''",
                        style:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color:Colors.green,
                        )
                  ),
                 Column(
                   children: [
                     Text("commandez et reservez en temps réel",
                       style:TextStyle(fontSize:17,fontStyle: FontStyle.italic )
                     ),
                   ],
                 ),
                  button( name:"se connecter",
                      color:Colors.green,
                      color_text:Colors.white,
                      context:context,
                    ontap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login_Page()));
                    }
                  ),
                  button( name:"s'enregistrer",
                      color:Colors.white,
                      color_text:Colors.green,
                      context:context,
                      ontap: (){

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                      }
                  ),

                ],
              )
            )
          )
        ]
      )
    );
  }
}