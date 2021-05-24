import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:fami_food_app/models/OrderModel.dart';
import 'package:fami_food_app/models/UserModel.dart';
import 'package:fami_food_app/models/boissonsModel.dart';
import 'package:fami_food_app/models/categories_models.dart';
import 'package:fami_food_app/models/food_model.dart';
import 'package:fami_food_app/models/produitAdminModel.dart';
import 'package:fami_food_app/models/produitModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {


  //******************************Log out***************************************

  Future<void> signOut() async{

    await FirebaseAuth.instance.currentUser.reload();
      await FirebaseAuth.instance.signOut();

    notifyListeners();

  }







  // ****************************current user info *****************************

List<UserModel> userList = [];
UserModel userModel;
String email = FirebaseAuth.instance.currentUser.email;

 Future<void>getUser()async{

  QuerySnapshot userData = await FirebaseFirestore.instance.collection('userData').where("email",isEqualTo: email).get();
  userData.docs.forEach((element) {userModel = UserModel(email:element.data()['email'],firstName:element.data()['firstName'],lastName:element.data()['lastName'],password:element.data()['password']); });

  notifyListeners();
}

get throwUser{
   return userModel;
}
  // **************************** get current user info *****************************

  var user;

  Future<void> getCurrentUser()async{
   user = FirebaseAuth.instance.currentUser;
  }
  get throwCurrentUser{
    return user;
  }


//***********************************allList********************************
  List<CategorieModel> allList = [];
  CategorieModel allModel;
  Future<void> getAll() async {
    List<CategorieModel> newAllList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("All")
        .get();

    querySnapshot.docs.forEach((element) {
      allModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newAllList.add(allModel);
      allList = newAllList;
    });
    notifyListeners();
  }

  get throwAllList {
    return allList;
  }
  //*****************************petitefaim list***********************************

  List<CategorieModel> faimList = [];
  CategorieModel faimModel;

  Future<void> getFaim() async {
    List<CategorieModel> newFaimList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("petite faim")
        .get();

    querySnapshot.docs.forEach((element) {
      faimModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newFaimList.add(faimModel);
      faimList = newFaimList;
    });
    notifyListeners();
  }

  get throwFaimList {
    return faimList;
  }

  //*****************************burgerList***********************************

  List<CategorieModel> burgerList = [];
  CategorieModel burgerModel;

  Future<void> getBurger() async {
    List<CategorieModel> newBurgerList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("burger")
        .get();

    querySnapshot.docs.forEach((element) {
      burgerModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newBurgerList.add(burgerModel);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get throwBurgerList {
    return burgerList;
  }

  //*****************************menuList***********************************

  List<CategorieModel> menusList = [];
  CategorieModel menusModel;

  Future<void> getMenus() async {
    List<CategorieModel> newMenusList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("Menus")
        .get();

    querySnapshot.docs.forEach((element) {
      menusModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newMenusList.add(menusModel);
      menusList = newMenusList;
    });
    notifyListeners();
  }

  get throwMenuList {
    return menusList;
  }

  //*****************************boissonsList***********************************

  List<CategorieModel> boissonsList = [];
  CategorieModel boissonsModel;

  Future<void> getBoissons() async {
    List<CategorieModel> newBoissonsList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("Boissons")
        .get();

    querySnapshot.docs.forEach((element) {
      boissonsModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newBoissonsList.add(boissonsModel);
      boissonsList = newBoissonsList;
    });
    notifyListeners();
  }

  get throwBoissonsList {
    return boissonsList;
  }

  //*****************************dessertsList***********************************

  List<CategorieModel> dessertsList = [];
  CategorieModel dessertsModel;

  Future<void> getDesserts() async {
    List<CategorieModel> newDessertsList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("IChldMhBiuGx4nlbOoBs")
        .collection("Desserts")
        .get();

    querySnapshot.docs.forEach((element) {
      dessertsModel = CategorieModel(
          name: element.data()['name'], image: element.data()['image']);

      newDessertsList.add(dessertsModel);
      dessertsList = newDessertsList;
    });
    notifyListeners();
  }

  get throwDessertsList {
    return dessertsList;
  }

  ///////////////////////////////////single food items///////////////////////////////////////////////////

  List<FoodModel> listFood = [];
  FoodModel foodModel;

  Future<void> getOneProduct() async {
    List<FoodModel> newFood = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("foods").get();

    querySnapshot.docs.forEach((element) {
      foodModel = FoodModel(
          name: element.data()['name'],
          image: element.data()['image'],
          price: element.data()['price'],

      );
      newFood.add(foodModel);
    });

    listFood = newFood;
    notifyListeners();
  }

  get throwFoodList {
    return listFood;
  }

  //**********************************burger managing""""""""""""""""""""""""""""""""""""""""""""""""""

List<FoodCategoriesModel> burgerCategoriesList =[];
  FoodCategoriesModel burgerCategoriesmodel;


  Future<void>getBurgerCategoriesList() async{
    List<FoodCategoriesModel> newBurgerCategoriesList=[];
   QuerySnapshot burgerDatas= await FirebaseFirestore.instance.collection('foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection("burger").get();

   burgerDatas.docs.forEach((element) {
     burgerCategoriesmodel = FoodCategoriesModel(
         image: element.data()['image'],
         name: element.data()['name'],
         price: element.data()['price'],
         bigDesc: element.data()['bigdescription'],
         litleDesc: element.data()['litledescription']
     );
     newBurgerCategoriesList.add(burgerCategoriesmodel);
     burgerCategoriesList =  newBurgerCategoriesList;

   });

    notifyListeners();
  }
  get throwBurgerCategoriesList{
    return burgerCategoriesList;
  }
  //************************Boissons Managing *************************************

  List<FoodCategoriesModel> boissonsCategoriesList =[];
  FoodCategoriesModel boissonsCategoriesmodel;


  Future<void>getBoissonsCategoriesList() async{
    List<FoodCategoriesModel> newBoissonsCategoriesList=[];
    QuerySnapshot boissonsDatas= await FirebaseFirestore.instance.collection('foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection("boissons").get();

    boissonsDatas.docs.forEach((element) {
      boissonsCategoriesmodel = FoodCategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
          price: element.data()['price'],
          bigDesc: element.data()['bigdescription'],
          litleDesc: element.data()['litledescription']
      );
      newBoissonsCategoriesList.add(boissonsCategoriesmodel);
      boissonsCategoriesList =  newBoissonsCategoriesList;

    });

    notifyListeners();
  }
  get throwBoissonsCategoriesList{
    return boissonsCategoriesList;
  }

  //************************Desserts Managing *************************************

  List<FoodCategoriesModel> dessertsCategoriesList =[];
  FoodCategoriesModel dessertsCategoriesmodel;


  Future<void>getDessertsCategoriesList() async{
    List<FoodCategoriesModel> newDessertsCategoriesList=[];
    QuerySnapshot dessertsDatas= await FirebaseFirestore.instance.collection('foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection("desserts").get();

    dessertsDatas.docs.forEach((element) {
      dessertsCategoriesmodel = FoodCategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
          price: element.data()['price'],
          bigDesc: element.data()['bigdescription'],
          litleDesc: element.data()['litledescription']
      );
      newDessertsCategoriesList.add(dessertsCategoriesmodel);
      dessertsCategoriesList =  newDessertsCategoriesList;

    });

    notifyListeners();
  }
  get throwDessertsCategoriesList{
    return dessertsCategoriesList;
  }

  //************************faim Managing *************************************

  List<FoodCategoriesModel> faimCategoriesList =[];
  FoodCategoriesModel faimCategoriesmodel;


  Future<void>getFaimCategoriesList() async{
    List<FoodCategoriesModel> newFaimCategoriesList=[];
    QuerySnapshot faimDatas= await FirebaseFirestore.instance.collection('foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection("faim").get();

    faimDatas.docs.forEach((element) {
      faimCategoriesmodel = FoodCategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
          price: element.data()['price'],
          bigDesc: element.data()['bigdescription'],
          litleDesc: element.data()['litledescription']
      );
      newFaimCategoriesList.add(faimCategoriesmodel);
      faimCategoriesList =  newFaimCategoriesList;

    });

    notifyListeners();
  }
  get throwFaimCategoriesList{
    return faimCategoriesList;
  }

  //************************Menus Managing *************************************

  List<FoodCategoriesModel> menusCategoriesList =[];
  FoodCategoriesModel menusCategoriesmodel;
FoodCategoriesModel boissonsMenu;

  Future<void>getMenusCategoriesList() async {
    List<FoodCategoriesModel> newMenusCategoriesList = [];
    QuerySnapshot menusDatas = await FirebaseFirestore.instance.collection(
        'foodcategories').doc("I3P3sqC8CHTdo72ucuzX").collection("menus").get();
    QuerySnapshot boissonsDatas = await FirebaseFirestore.instance.collection(
        'foodcategories').doc("I3P3sqC8CHTdo72ucuzX")
        .collection("boissons")
        .get();



    boissonsDatas.docs.forEach((element) { boissonsMenu = FoodCategoriesModel(
      image: element.data()['image'],
      name: element.data()['name'],
      price: element.data()['price'],
      bigDesc: element.data()['bigdescription'],
      litleDesc: element.data()['litledescription']);
        });


    menusDatas.docs.forEach((element) {
      menusCategoriesmodel = FoodCategoriesModel(
          image: element.data()['image'],
          name: element.data()['name'],
          price: element.data()['price'],
          bigDesc: element.data()['bigdescription'],
          litleDesc: element.data()['litledescription'],
          boissons: boissonsMenu

      );


      newMenusCategoriesList.add(menusCategoriesmodel);
      menusCategoriesList = newMenusCategoriesList;
    });
    notifyListeners();
  }

  get throwMenusCategoriesList{
    return menusCategoriesList;
  }
  
  //***************************************Order Managing*************************************************************
  List<OrderModel> orderList = [];
  OrderModel order;
  
  Future<void> getAllOrder()async{


    List<OrderModel> newOrderList =[];
   QuerySnapshot orderDatas = await FirebaseFirestore.instance.collection('order').get();
   
   orderDatas.docs.forEach((element) { order = OrderModel(

     commandName: element.data()["commandName"],
     date:element.data()["date"],
     etatCommande: element.data()["etatCommande"],
     productList: element.data()["list"],
     total: element.data()["total"]

   );

   newOrderList.add(order);


   });
   orderList=newOrderList;
    notifyListeners();
    print(order.total);
  }

  get throwOrderList{
    return orderList;
  }
  
  
  //*************************************ajout au panier **************************************

List<ProduitModel> produitList=[];
  ProduitModel produitModel;
  List<ProduitModel> newProduitList=[];
  double total =0;

 void ajouterAuPanier(@required ProduitModel produit){


   produitModel = produit;

   newProduitList.add(produitModel);
   produitList = newProduitList;

 }
 get throwProduitList{
   print(total);
   return produitList;

 }
//*************************************ajout boisson au menu **************************************


  BoissonModel boissonsMenuModel;
  void ajouterBoissonsMenu(@required BoissonModel boissons){

    boissonsMenuModel = boissons;

  }
  get throwBoissonsMenu{
    return boissonsMenuModel;
  }

 double totalfunc(){

   total = 0;
   produitList.forEach((element) { total += (element.price * element.quantity);});
       return total;
 }



 

}


