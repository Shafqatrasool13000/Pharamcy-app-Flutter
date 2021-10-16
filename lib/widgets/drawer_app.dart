import 'package:flutter/material.dart';
import 'package:shop_app/screens/log_out_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../screens/log_out_screen.dart';
class  DrawerData extends StatelessWidget {
  static String routeName='/DrawerShow';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading:Icon(Icons.shop) ,
            title: Text('Shopping'),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);

            },
            leading:Icon(Icons.star_border) ,
            title: Text('My Order'),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);

            },
            leading:Icon(Icons.edit) ,
            title: Text('Manage Order'),
          ),
    ListTile(
    onTap: (){
    Navigator.of(context).pushReplacementNamed(LogOutScreen.routeName);

    },
    leading:Icon(Icons.exit_to_app) ,
    title: Text('Log OUt'),
    ),],
      ),
    );
  }
}
