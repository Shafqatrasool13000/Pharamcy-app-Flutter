import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products_provider.dart';
import '../widgets/drawer_app.dart';
import '../widgets/user_product_item.dart';
import './edit_product_screen.dart';
class UserProductsScreen extends StatelessWidget {
  static const String routeName='/userProducts-screen';

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<ProductsProvider>(context).allProductsItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.pushNamed(context,EditProductScreen.routeName);
          }),
        ],
      ),
      drawer:DrawerData(),
      body: ListView.builder(
          itemCount: productsData.length,
          itemBuilder: (ctx,index)=>Column(
            children: <Widget>[
              UserProductItem(
                productsData[index].id,
              productsData[index].title, productsData[index].imageUrl),
            Divider(),
            ],

          ),

      ),
    );
  }
}
