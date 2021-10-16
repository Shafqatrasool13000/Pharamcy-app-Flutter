import 'package:flutter/foundation.dart';
import 'package:shop_app/provider/cart_provider.dart';

class Order{
 final String id;
 final DateTime dateTime;
 final List<CartItem> cartItems;
 final double totalAmount;
 Order({@required this.dateTime,
   @required this.id,
   @required this.totalAmount,
   @required  this.cartItems});
}
class OrderProvider with ChangeNotifier{
  List<Order> _orders=[];
  List<Order> get orders{
    return [..._orders];
  }
  void addOrder(double total,List<CartItem> cartItems){
    _orders.insert(0,Order(dateTime: DateTime.now(),
        id: DateTime.now().toString(),
        totalAmount: total,
        cartItems:cartItems),
    );
    notifyListeners();
  }

}
