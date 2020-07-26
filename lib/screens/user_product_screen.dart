import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/screens/edit_product_screen.dart';
import 'package:shops/widgets/app_drawer.dart';
import 'package:shops/widgets/user_product_item.dart';

import '../providers/products.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-product-screen";

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (ctx, index) => Column(
            children: <Widget>[
              UserProductItem(
                id: productsData.items[index].id,
                title: productsData.items[index].title,
                imageUrl: productsData.items[index].imageUrl,
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
