import 'package:flutter/foundation.dart';

class UserModel{
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  UserModel({@required this.email, @required this.firstName,@required this.lastName, @required this.password});
}