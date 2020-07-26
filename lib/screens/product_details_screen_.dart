import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findbyId(productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "\$${loadedProduct.price}",
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "${loadedProduct.description}",
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              )
            ],
          ),
        ));
  }
}