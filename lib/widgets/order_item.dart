import 'dart:math';

import 'package:flutter/material.dart';
import '../provider/order_provider.dart';
import 'package:intl/intl.dart';
class OrderItem extends StatefulWidget {
  final Order orderItem;
  OrderItem(this.orderItem);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title:Text('Rs: ${widget.orderItem.totalAmount}') ,
            subtitle: Text('${widget.orderItem.dateTime}'),
            trailing: IconButton(icon:Icon(Icons.expand_more),onPressed: (){
              setState(() {
                _isExpanded=!_isExpanded;
              });
              },),
          ),
          if(_isExpanded) Container(
            height: min(widget.orderItem.cartItems.length*20.0+100, 180),
            child:ListView(
              padding: EdgeInsets.all(10),
              children: widget.orderItem.cartItems.map((e) => ListTile(
                title:Text('${e.title}') ,
                subtitle:Text('${widget.orderItem.dateTime}') ,
                trailing: Text('Rs:${(e.price*e.quantity).toStringAsFixed(2)}'),
              )).toList(),
            ) ,
          )
        ],
      ),
    );
  }
}
