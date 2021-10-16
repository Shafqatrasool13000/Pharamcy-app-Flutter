import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/products_provider.dart';
import '../screens/edit_product_screen.dart';
class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItem(this.id,this.title,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title:Text(title),
        leading:CircleAvatar(
          backgroundImage:NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit), onPressed:(){
              Navigator.pushNamed(context, EditProductScreen.routeName,arguments: id);
              }),
              IconButton(
                  icon: Icon(Icons.delete), onPressed:(){
                  Provider.of<ProductsProvider>(context,listen: false).removeItem(id);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
