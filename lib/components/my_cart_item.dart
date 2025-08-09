import 'package:flutter/material.dart';
import 'package:my_submission_app/model/salad_item.dart';
import 'package:provider/provider.dart';
import 'package:my_submission_app/model/cart.dart';

class MyCartItem extends StatelessWidget {
  final SaladItem salad;

  const MyCartItem({super.key, required this.salad});

  // Remove item from cart
  void removeItemFromCart(BuildContext context, SaladItem salad) {
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
              leading: Image.asset(salad.imageAssets),
              title: Text(
                salad.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 3),
                child: Text(
                  salad.price,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  removeItemFromCart(context, salad);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
