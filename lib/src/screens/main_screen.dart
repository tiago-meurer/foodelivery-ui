import 'package:flutter/material.dart';

// Pages
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/favorite_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  @override
  void initState(){
    //TODO: Complement initState
    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, favoritePage, profilePage];

    currentPage = homePage;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Início")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Pedidos")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favoritos")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil")
          ),
        ],
      ),
      body: currentPage,
    );
       
  }
}