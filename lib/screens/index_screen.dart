import 'package:flutter/material.dart';
import '../provider/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../provider/order_provider.dart';
import '../screens/user_products_screen.dart';
import '../screens/edit_product_screen.dart';
import '../screens/user_products_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import './products_overview_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/products_overview_screen.dart';
import '../screens/product_details_screen.dart';
import '../provider/products_provider.dart';
import 'log_in_screen.dart';
import 'log_out_screen.dart';
import './chatScreen.dart';
import './front_page.dart';
class IndexScreen extends StatefulWidget {
static const routeName='index-screen';
  @override
  _IndexScreenState createState() => _IndexScreenState();
}



class _IndexScreenState extends State<IndexScreen> {

  int currentTab = 0;
  ProductsOverView productsOverView;
  OrdersScreen orders;
  UserProductsScreen userProductsScreen;
  CartScreen cartScreen;
  FrontScreen frontPage;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {

    productsOverView = ProductsOverView();
    orders = OrdersScreen();
    userProductsScreen= UserProductsScreen();
    cartScreen = CartScreen();
    frontPage=FrontScreen();
    pages = [frontPage,productsOverView, cartScreen,  orders, userProductsScreen,];


    currentPage = frontPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.red[900],
        onPressed: (){
          Navigator.pushNamed(context, ChatScreen.routeName);
        },
        label:
        Row(
          children: <Widget>[
            Text('Chat', style: TextStyle(color:Colors.white, fontSize: 15, fontWeight:FontWeight.bold),),
            SizedBox(width:5),
            Icon(Icons.chat_bubble, color: Colors.white, size: 15,)
          ],
        ), backgroundColor: Colors.red[900],),
      body: currentPage,
      bottomNavigationBar:  TitledBottomNavigationBar(
        currentIndex: currentTab,
        inactiveColor: Colors.red[900],
        indicatorColor: Colors.red[900],
        reverse: true,
        activeColor: Colors.red[900],
        onTap: (index){
          setState(() {
            currentPage = pages[index];
            currentTab = index;
          });
        },

        items: [
          TitledNavigationBarItem(icon: Icons.line_weight, title: "Main Page",),
          TitledNavigationBarItem(icon: Icons.shop, title: "products"),
          TitledNavigationBarItem(icon: Icons.shopping_cart, title: 'Cart'),
          TitledNavigationBarItem(icon: Icons.apps, title: "My Order"),
          TitledNavigationBarItem(icon: Icons.assignment_turned_in, title: "Manage Products"),

        ],
      ),

    );
  }
}