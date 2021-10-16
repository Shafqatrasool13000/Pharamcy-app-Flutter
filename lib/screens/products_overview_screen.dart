import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/products_provider.dart';
import 'package:shop_app/screens/log_out_screen.dart';
import './cart_screen.dart';
import '../provider/product_model.dart';
import '../widgets/product_item.dart';
import '../provider/products_provider.dart';
import '../widgets/badge.dart.dart';
import '../widgets/products_grid_view.dart';
import '../widgets/drawer_app.dart';
import '../screens/orders_screen.dart';
import '../screens/products_overview_screen.dart';
import '../screens/product_details_screen.dart';
import '../provider/products_provider.dart';
import '../provider/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../provider/order_provider.dart';
import '../screens/user_products_screen.dart';
import '../screens/edit_product_screen.dart';
import '../screens/user_products_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
enum showingFilters { ShowFavourites, ShowAll }


class ProductsOverView extends StatefulWidget {
  static const String routeName='ProductsOverview-Screen';
  @override
  _ProductsOverViewState createState() => _ProductsOverViewState();
}

class _ProductsOverViewState extends State<ProductsOverView> {
  bool _favourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerData(),
      appBar: AppBar(
        title: Text(
          'Shop Here',
          style: Theme.of(context).appBarTheme.textTheme.bodyText1,
        ),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Show Favourite'),
                value: showingFilters.ShowFavourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: showingFilters.ShowAll,
              ),
            ],
            onSelected: (showingFilters filter) {
              setState(() {
                if (filter == showingFilters.ShowFavourites) {
                  _favourites = true;
                } else {
                  _favourites = false;
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Consumer<CartItemsProvider>(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routName);
                },
              ),
              builder: (ctx, cart, ch) => Badge(
                  color: cart.itemCount == 0
                      ? Theme.of(context).accentColor
                      : Colors.red,
                  child: ch,
                  value: cart.itemCount.toString()),
            ),
          ),
        ],
      ),
      body: ProductsGridView(_favourites),
    );
  }
}
