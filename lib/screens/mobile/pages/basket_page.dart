import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_cart_item.dart';
import 'package:my_submission_app/model/salad_item.dart';
import 'package:my_submission_app/model/cart.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  //TODO: create fully functioning shopping cart
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                child: Text(
                  'My Basket',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  final newSalad = value.getUserCart()[index];
                  return MyCartItem(salad: newSalad);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
