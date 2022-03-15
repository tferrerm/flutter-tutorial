import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int qty;
  final String title;

  const CartItem(
      {Key? key,
      required this.id,
      required this.price,
      required this.qty,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price'))),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * qty}'),
          trailing: Text('$qty x'),
        ),
      ),
    );
  }
}
