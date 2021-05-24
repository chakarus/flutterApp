import 'package:fami_food_app/models/CardModel.dart';

class StripTransactionResponse{
  final String message;
  final bool success;

  StripTransactionResponse({this.message, this.success});


}

class StripeService{
  static String apiBase = "https://api.stripe.com/v1";
  static String secret ="";

  static init(){}

  static StripTransactionResponse payViaExistingCard({double amount,String currency,CardModel card}){
     return StripTransactionResponse(
         message:"transaction accepté",
         success:true);
  }

  static StripTransactionResponse payWithNewCard({double amount,String currency,CardModel card}){
    return StripTransactionResponse(
        message:"transaction accepté",
        success:true);
  }
}