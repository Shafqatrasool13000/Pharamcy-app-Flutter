import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/order_provider.dart';
import 'package:shop_app/screens/orders_screen.dart';
import '../provider/cart_provider.dart' show CartItemsProvider ;

import '../widgets/cart_products_items.dart';

class CartScreen extends StatelessWidget {
  static String routName='/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<CartItemsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total',style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),),
                  Spacer(),
                  Chip(
                    backgroundColor: Colors.red,
                    label: Text('Rs: ${cart.totalAmount.toStringAsFixed(2)}'),),
                  FlatButton(
                    onPressed: (){
                      Provider.of<OrderProvider>(context,listen: false).addOrder(cart.totalAmount,
                      cart.items.values.toList());
                      cart.clearCart();

                    }, child: Text('Order Now',style: Theme.of(context).textTheme.headline6,),),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context,index)=>CartItem(cart.items.values.toList()[index].price,
                    cart.items.values.toList()[index].quantity,
                    cart.items.values.toList()[index].title,
                    cart.items.values.toList()[index].id,
                cart.items.keys.toList()[index]),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
