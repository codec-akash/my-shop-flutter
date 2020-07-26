import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/providers/products.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavs;

  const ProductsGrid(this._showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        _showFavs ? productsData.favouritesItem : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (c) => products[index], since we are not using context we an use value operator
        value: products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
      ),
    );
  }
}
