import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
class CartItem extends StatelessWidget {
 final String id;
 final String productId;
 final String title;
 final double price;
 final int quantity;
CartItem(this.price,this.quantity,this.title,this.id,this.productId);
 @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: <Widget>[
          Dismissible(
            confirmDismiss: (value){
              return showDialog(context: context,builder: (ctx)=>AlertDialog(
                title: Text('Alert!',textAlign: TextAlign.center,),
                content: Text('Do you want to Delete'),
                actions: <Widget>[
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop(true);
                  }, child: Text('ok'),),
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop(false);

                  }, child: Text('no'),),

                ],
              ));
            },
            background: Container(
              color: Theme.of(context).errorColor,
              child:Icon(Icons.delete),alignment: Alignment.centerRight,),
            key: ValueKey(id),
            onDismissed: (item){
              Provider.of<CartItemsProvider>(context,listen: false).itemRemove(productId);
              },
            direction:DismissDirection.endToStart ,
            child: ListTile(
              title: Text('$title'),
              subtitle:Text('${(price*quantity).toStringAsFixed(2)}') ,
              trailing: Text('$quantity x') ,
              leading:CircleAvatar(
                child:Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(child: Text('Rs:${price.toStringAsFixed(2)}'))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
