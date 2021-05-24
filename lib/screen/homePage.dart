import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fami_food_app/models/FoodCategoriesModel.dart';
import 'package:fami_food_app/models/UserModel.dart';
import 'package:fami_food_app/models/categories_models.dart';
import 'package:fami_food_app/models/food_model.dart';
import 'package:fami_food_app/provider/my_provider.dart';
import 'package:fami_food_app/screen/categories.dart';
import 'package:fami_food_app/screen/details_page.dart';
import 'package:fami_food_app/screen/login_page.dart';
import 'package:fami_food_app/screen/widget/MyDetailCate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



 final  auth = FirebaseAuth.instance;
  TextEditingController search = TextEditingController();
  List<CategorieModel> allCategorieList = [];
  List<FoodCategoriesModel> burgerCategoriesList = [];
  List<FoodCategoriesModel> dessertsCategoriesList = [];
  List<FoodCategoriesModel> boissonsCategoriesList = [];
  List<FoodCategoriesModel> menusCategoriesList = [];
  List<FoodCategoriesModel> faimCategoriesList = [];

  List<FoodCategoriesModel> allCategList = [];

  List<CategorieModel> burgerlist = [];
  List<CategorieModel> menuList = [];
  List<CategorieModel> allList = [];
  List<CategorieModel> dessertsList = [];
  List<CategorieModel> boissonsList = [];
  List<CategorieModel> faimList = [];
  List<FoodModel> foodList = [];
  User user ;

  Widget drawerChoice({@required String name, @required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }

  Widget categorieContainer(
      {@required String imageName,
      @required String textCategorie,
      @required Function onTap}) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageName), fit: BoxFit.scaleDown),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(textCategorie,
              style: TextStyle(fontSize: 20, color: Colors.white,))
        ],
      ),
    );
  }

  Widget all() {
    return Row(
        children: allList
            .map((e) =>
                categorieContainer(imageName: e.image, textCategorie: e.name))
            .toList());
  }

  Widget burger() {
    return Row(
        children: burgerlist
            .map((e) => categorieContainer(
                imageName: e.image,
                textCategorie: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: burgerCategoriesList)));
                }))
            .toList());
  }

  Widget menus() {
    return Row(
        children: menuList
            .map((e) => categorieContainer(
                imageName: e.image,
                textCategorie: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: menusCategoriesList)));
                }))
            .toList());
  }

  Widget desserts() {
    return Row(
        children: dessertsList
            .map((e) => categorieContainer(
                imageName: e.image,
                textCategorie: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: dessertsCategoriesList)));
                }))
            .toList());
  }

  Widget boissons() {
    return Row(
        children: boissonsList
            .map((e) => categorieContainer(
                imageName: e.image,
                textCategorie: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: boissonsCategoriesList)));
                }))
            .toList());
  }

  Widget faim() {
    return Row(
        children: faimList
            .map((e) => categorieContainer(
                imageName: e.image,
                textCategorie: e.name,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: faimCategoriesList)));
                }))
            .toList());
  }

  Widget food() {
    return Row(
        children: foodList
            .map((e) => MyDetailCate(
                textImage: e.image, textLibelle: e.name, price: e.price))
            .toList());
  }

  Future<void> getCurrentUser()async{
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });

  }
  Future<void> _signOut()async{


     await auth.signOut();


    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Login_Page()));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();

  }


  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);



    // provider.getCurrentUser();
    // user = provider.throwCurrentUser;

    provider.getAll();
    allList = provider.throwAllList;

    provider.getBurger();
    burgerlist = provider.throwBurgerList;

    provider.getMenus();
    menuList = provider.throwMenuList;

    provider.getFaim();
    faimList = provider.throwFaimList;

    provider.getDesserts();
    dessertsList = provider.throwDessertsList;

    provider.getBoissons();
    boissonsList = provider.throwBoissonsList;

    provider.getOneProduct();
    foodList = provider.throwFoodList;

    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;

    provider.getDessertsCategoriesList();
    dessertsCategoriesList = provider.throwDessertsCategoriesList;

    provider.getBoissonsCategoriesList();
    boissonsCategoriesList = provider.throwBoissonsCategoriesList;

    provider.getMenusCategoriesList();
    menusCategoriesList = provider.throwMenusCategoriesList;

    provider.getFaimCategoriesList();
    faimCategoriesList = provider.throwFaimCategoriesList;

    // provider.getAllCategorie();
    // allCategorieList = provider.throwAllCategorieList;

    allCategList.addAll(burgerCategoriesList);
    allCategList.addAll(dessertsCategoriesList);
    allCategList.addAll(boissonsCategoriesList);
    allCategList.addAll(faimCategoriesList);

    return Scaffold(
      drawer: Drawer(

          child: SafeArea(
              child: Container(
        color: Color(0xff3a3e3e),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserAccountsDrawerHeader(
                // accountName: Text(" ${user.firstName} ${user.lastName} "),
                accountEmail: Text(user.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/chakib.jpg"),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/degradeBackground.jpg"),
                        fit: BoxFit.cover))),
            drawerChoice(name: "Profile", icon: Icons.person),
            drawerChoice(name: "Panier", icon: Icons.add_shopping_cart),
            drawerChoice(name: "Commande", icon: Icons.shop),
            drawerChoice(name: "À propos", icon: Icons.info),
            Divider(thickness: 3, color: Colors.white),
            ListTile(
              leading: Text("Communicate",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            drawerChoice(name: "Change", icon: Icons.lock),
            GestureDetector(
              child: drawerChoice(name: "Logout", icon: Icons.exit_to_app),
              onTap: () {


                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Login_Page()));
              },
            ),
          ],
        ),
      ))),
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.sort),
        actions: [
          Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                child:IconButton(icon:Icon(Icons.exit_to_app),onPressed:_signOut

                )
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: search,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // allCategorieList
                      //     .map(
                      //       (e) => categorieContainer(
                      //         imageName: e.image,
                      //         textCategorie: e.name,
                      //
                      //       ),
                      //     )
                      //     .toList(),

                      all(),
                      menus(),
                      burger(),
                      boissons(),
                      faim(),
                      desserts()
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    children: allCategList
                        .map(
                          (e) => MyDetailCate(
                            textImage: e.image,
                            textLibelle: e.name,
                            price: e.price,
                            bigDesc: e.bigDesc,
                            litleDesc: e.litleDesc,
                            ontap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailsPage(
                                    image: e.image,
                                    name: e.name,
                                    price: e.price,
                                    bigDesc: e.bigDesc,
                                    litleDesc: e.litleDesc,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
