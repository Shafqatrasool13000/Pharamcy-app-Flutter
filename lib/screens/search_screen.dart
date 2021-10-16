import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  static const routeName='search-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10)
           ),
            labelText: 'Search products and brands',
            hintText:  'Search products and brands',
          ),
        ),
      )),
    );
  }
}
