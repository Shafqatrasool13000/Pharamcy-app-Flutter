import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer_app.dart';
import '../provider/order_provider.dart';
import '../widgets/order_item.dart';
class OrdersScreen extends StatelessWidget {
  static String routeName='/Order-Screen';
  @override
  Widget build(BuildContext context) {
   final ordersData=Provider.of<OrderProvider>(context);
    return Scaffold(
      drawer: DrawerData(),
      appBar: AppBar(title:Text('Your Orders')),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context,index)=>OrderItem(ordersData.orders[index]),
      )
    );
  }
}
