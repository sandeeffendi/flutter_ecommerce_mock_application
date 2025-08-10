import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_category_list.dart';
import 'package:my_submission_app/components/my_recommended_list.dart';
import 'package:my_submission_app/model/background_color_list.dart';
import 'package:my_submission_app/model/salad_item.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';
import 'package:provider/provider.dart';
import 'package:my_submission_app/model/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // make random value for index
  // final random = Random();
  String _selectedValue = 'Hottest';
  String? username = '';

  // Load username method
  Future<void> loadUsername() async {
    final prefsService = SharedPrefsServices();
    final name = await prefsService.getUsername();
    setState(() {
      username = name;
    });
  }

  // Add salad to cart
  void addSaladToCart(SaladItem salad) {
    Provider.of<Cart>(context, listen: false).addUserCart(salad);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successfully added',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Text(
          'Check your basket!',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<Cart>(
      builder: (context, value, child) {
        List<SaladItem> currentList;

        if (_selectedValue == 'Hottest') {
          currentList = saladItemHottestList;
        } else if (_selectedValue == 'Popular') {
          currentList = saladItemPopularList;
        } else if (_selectedValue == 'New') {
          currentList = saladItemNewList;
        } else {
          currentList = [];
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  // Shop Page Main Display
                  Column(
                    crossAxisAlignment: screenWidth > 600
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      // Greeting Text
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello $username!',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'What fruit\'s salad combo do you want today?',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Recommended Combo
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recommended Combo',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 170,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final SaladItem salad = value
                                      .saladList()[index];
                                  return MyRecommendedList(
                                    name: salad.name,
                                    price: salad.price,
                                    imageAssets: salad.imageAssets,
                                    onTap: () => addSaladToCart(salad),
                                  );
                                },
                                itemCount: saladItemList.length,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Shop Item Category
                      // TODO: Create Category NAV:  Hottest, Popular, and New Combo
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: SegmentedButton(
                                  emptySelectionAllowed: true,

                                  segments: [
                                    // Hottest Category
                                    ButtonSegment(
                                      value: 'Hottest',
                                      label: Text(
                                        'Hottest',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),

                                    // Popular Category
                                    ButtonSegment(
                                      value: 'Popular',
                                      label: Text(
                                        'Popular',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),

                                    // New Combo
                                    ButtonSegment(
                                      value: 'New',
                                      label: Text(
                                        'New',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                    ),
                                  ],

                                  selected: <String>{_selectedValue},
                                  onSelectionChanged:
                                      (Set<String> newSelection) {
                                        setState(() {
                                          _selectedValue = newSelection.first;
                                        });
                                      },
                                  showSelectedIcon: false,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.resolveWith((
                                          states,
                                        ) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return Theme.of(
                                              context,
                                            ).colorScheme.primary;
                                          }
                                          return Theme.of(
                                            context,
                                          ).colorScheme.tertiary;
                                        }),
                                  ),
                                ),
                              ),
                            ),

                            //Category list
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                  height: 170,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final ColorList color =
                                          backgroundColorList[index %
                                              backgroundColorList.length];
                                      final SaladItem item = currentList[index];
                                      return MyCategoryList(
                                        name: item.name,
                                        price: item.price,
                                        imageAssets: item.imageAssets,
                                        color: color.color,
                                      );
                                    },
                                    itemCount: currentList.length,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        );
      },
    );
  }
}
