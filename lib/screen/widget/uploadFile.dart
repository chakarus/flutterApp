import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatelessWidget {
  Function onpressed;

  UploadFile({this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        color: Colors.white,
        child: Row(
          children: [
            FloatingActionButton(
                onPressed: onpressed, child: Icon(Icons.upload_file)),
            SizedBox(width:15),
            Text("importer fichier",style:TextStyle(fontSize: 18))
          ],
        ));
  }
}
