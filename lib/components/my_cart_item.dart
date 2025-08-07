import 'package:flutter/material.dart';
import 'package:my_submission_app/model/salad_item.dart';
import 'package:provider/provider.dart';
import 'package:my_submission_app/model/cart.dart';

class MyCartItem extends StatefulWidget {
  final SaladItem salad;

  const MyCartItem({super.key, required this.salad});

  @override
  State<MyCartItem> createState() => _MyCartItemState();
}

class _MyCartItemState extends State<MyCartItem> {
  // Remove item from cart
  void removeItemFromCart(SaladItem salad) {
    Provider.of<Cart>(context, listen: false).removeUserCart(salad);

    // alert user item has been deleted
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Item Deleted',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Image.asset(widget.salad.imageAssets),
              title: Text(
                widget.salad.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 3),
                child: Text(
                  widget.salad.price,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  removeItemFromCart(widget.salad);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
