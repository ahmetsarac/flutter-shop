import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      {Key? key,
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content:
                    const Text('Do you want to remove item from the  cart?'),
                actions: [
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$$price')),
            )),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
