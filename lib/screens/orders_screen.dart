import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops/widgets/app_drawer.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  // var _isLoading = false;

//With Future.delayed

  // @override
  // void initState() {
  //   // You can use didChangeDependence also is this just for trying future delay.
  //   Future.delayed(Duration.zero).then((_) async {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

//Without Future.delayed:-
//   @override
//   void initState() {
//     // _isLoading = true;
//     // Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
//     //   setState(() {
//     //     _isLoading = false;
//     //   });
//     // });

// //Alternative of this in body -- FutureBuilder
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context); // bcoz this will run the buld in loop so sing consumer instead of provider.
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapShot.error != null) {
              //...
              //Do error handling
              return Center(
                child: Text("Error"),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, index) =>
                      OrderItem(orderData.orders[index]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
