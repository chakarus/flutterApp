import "package:flutter/material.dart";

class My_Text_Field extends StatelessWidget {
  final String name;
  final bool obscureText;
  final TextEditingController controller;

  My_Text_Field(
      {@required this.name, this.obscureText, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(

          hintText: name,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
