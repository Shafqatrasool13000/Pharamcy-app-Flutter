import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';
import './product_item.dart';
import '../provider/product_model.dart';
class ProductsGridView extends StatelessWidget {
final bool showFavourite;
ProductsGridView(this.showFavourite);
  @override
  Widget build(BuildContext context) {
    final showAllProducts=Provider.of<ProductsProvider>(context,listen: false);
    final productItem=showFavourite?showAllProducts.favouriteProducts:showAllProducts.allProductsItems;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: 1.7,
        crossAxisSpacing:20, ),
      itemCount:productItem.length,
      itemBuilder: (context,index,)=>ChangeNotifierProvider.value(
        value:productItem[index],

        child: ProductItem(),
      ),
    );
  }
}
