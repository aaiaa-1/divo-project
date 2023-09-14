import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/orders.dart';

class OrdersCard extends StatelessWidget {
  final Product product;
  const OrdersCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(top: 8.0, left: 20, bottom: 8.0, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.asset(
            product.image,
            width: 48,
            height: 48,
          ),
          title: Text(product.title), // Product title
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Delivery Person: ${product.deliveryPerson}'), // Delivery person
              Text('Order Date: ${product.date}'), // Order date
              Text('Price: \$${product.price.toStringAsFixed(2)}'), // Price
            ],
          ),
          trailing: const Icon(CupertinoIcons.check_mark_circled),
        ),
      ),
    );
  }
}
