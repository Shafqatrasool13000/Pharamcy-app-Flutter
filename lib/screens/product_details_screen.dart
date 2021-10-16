import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';
import '../widgets/product_item.dart';
class ProductDetails extends StatelessWidget {
  static const String productDetails='/product-details';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as String;

   final productsData=Provider.of<ProductsProvider>(context,listen: false).compareId(productId);


    return Scaffold(
      appBar: AppBar(
        title: Text(productsData.title),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(  child: Image.network(productsData.imageUrl,fit: BoxFit.cover,)),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Rs ${productsData.price.toStringAsFixed(2)}',style: TextStyle(
              fontSize: 25,
              fontFamily: 'Anton'
            ),),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('${productsData.description}',style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),softWrap: true,),
            ),

          ],
        ),
      ),
    );
    }
}
