import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../screens/product_details_screen.dart';
import '../provider/product_model.dart';
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context,listen: false);
    final cart=Provider.of<CartItemsProvider>(context,listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10) ,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetails.productDetails,arguments: product.id,);
        },
        child: GridTile(
            footer: GridTileBar(
              backgroundColor:Colors.black54,
              leading: Consumer<Product>(
                builder: (ctx,product,child)=>IconButton(
                  color: Theme.of(context).accentColor,
                  onPressed: (){
                    product.toggleIsFavouriteChange();
                  },
                  icon: Icon(
                    product.isFavourite?Icons.favorite:Icons.favorite_border,),
                ),

              ),
              title:
              Text('${product.title}',textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Anton'
                ),
              ),
              trailing: IconButton(
                  onPressed: (){

                  },
                  color: Theme.of(context).accentColor,
                  icon: IconButton( icon:Icon(Icons.shopping_cart),onPressed: (){
                   Scaffold.of(context).hideCurrentSnackBar();
                    cart.addCartItem(product.id, product.title, product.price);
                   Scaffold.of(context).showSnackBar(

                     SnackBar(
                       duration: Duration(seconds: 2),
                       action:SnackBarAction(label: 'Undo', onPressed: (){
                        cart.removeItem(product.id);
                       }),
                       content: Text('Product Added to Cart!'),),);
                  },),),
            ),
            child:Image.network('${product.imageUrl}') ),
      ),


  );
    }
}
