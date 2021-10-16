import 'package:flutter/foundation.dart';
class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({@required this.title,
    @required this.id,
    @required this.price,
    @required this.quantity,});

}
class CartItemsProvider with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items {
    return {..._items};
  }
   int get itemCount {
    return _items.length;
   }
   double get totalAmount{
    double total=0.0;
    _items.forEach((key, cartItem) {
      total+=cartItem.price*cartItem.quantity;
    });
    return total;
   }
   void removeItem(String productId){
    if(!_items.containsKey(productId)){
      return;
    }
    if(_items[productId].quantity>1){
      print(_items[productId].quantity);
      _items.update(productId, (existingProduct) =>CartItem(title: existingProduct.title,
          id: existingProduct.id,
          price: existingProduct.price,
          quantity: existingProduct.quantity-1) );
    }else{
      _items.remove(productId);
    }
    notifyListeners();
   }
   void itemRemove(String productId){
        _items.remove(productId);
         notifyListeners();
   }
   void clearCart(){
    _items.clear();
    notifyListeners() ;
   }
  void addCartItem(String productId, String title,double price) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingItem) =>
          CartItem(title: existingItem.title,
              id: existingItem.id,
              price: existingItem.price, quantity: existingItem.quantity + 1));
    } else {
      _items.putIfAbsent(productId, () =>
          CartItem(title: title,
            id: DateTime.now().toString(),
            price: price,
            quantity: 1,));
    }
    notifyListeners();
  }
}
