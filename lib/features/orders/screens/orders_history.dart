import 'package:flutter/material.dart';
import '../../../models/orders.dart'; // Import the orders.dart file
import '../widgets/order_card.dart';

class OrdersHistory extends StatefulWidget {
  static const String routeName = '/orders-history';

  const OrdersHistory({super.key});

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 35, top: 8, bottom: 8),
          child: Text(
            'Orders History',
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF17203A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount:
                products.length, // Access the products list from orders.dart
            itemBuilder: (context, index) {
              return OrdersCard(
                product: products[index],
              );
            },
          ),
        ),
      ],
    ));
  }
}
