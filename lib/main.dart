import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/chatScreen.dart';
import 'package:shop_app/screens/index_screen.dart';
import 'package:shop_app/screens/log_in_screen.dart';
import 'package:shop_app/screens/log_out_screen.dart';
import 'package:shop_app/widgets/drawer_app.dart';
import './screens/orders_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_details_screen.dart';
import './provider/products_provider.dart';
import './provider/cart_provider.dart';
import './screens/cart_screen.dart';
import './provider/order_provider.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import 'screens/splash.dart';
import './screens/log_in_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartItemsProvider()),
        ChangeNotifierProvider.value(value: OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetails.productDetails: (ctx) => ProductDetails(),
          CartScreen.routName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          DrawerData.routeName: (ctx) => DrawerData(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          LogInScreen.routeName: (ctx) => LogInScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          ProductsOverView.routeName: (ctx) => ProductsOverView(),
          IndexScreen.routeName: (ctx) => IndexScreen(),
          LogOutScreen.routeName: (ctx) => LogOutScreen(),
          ChatScreen.routeName: (ctx) => ChatScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'Lato',
            ),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.red,
            textTheme: TextTheme(
              bodyText2: TextStyle(
                fontFamily: 'Anton',
                fontSize: 25,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Anton',
              ),
            ),
          ),
        ),
        title: 'Shop App',
        home: Splash(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ProductsProvider()),
          ChangeNotifierProvider.value(value: CartItemsProvider()),
          ChangeNotifierProvider.value(value: OrderProvider()),
        ],
        child: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('waiting');
              } else {
                if (snapshot.hasData) {
                  return IndexScreen();
                } else {
                  return LogInScreen();
                }
              }
            }));
  }
}
