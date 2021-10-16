import 'package:flutter/foundation.dart';
class Product with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;
Product({@required this.id,
  @required this.title,
  @required this.imageUrl,
  @required this.description,
  this.isFavourite=false,
  @required this.price});

void toggleIsFavouriteChange(){
  isFavourite=!isFavourite;
   notifyListeners();
}
}