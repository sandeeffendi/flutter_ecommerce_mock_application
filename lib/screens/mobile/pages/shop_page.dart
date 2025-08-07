import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_submission_app/components/my_recommended_list.dart';
import 'package:my_submission_app/model/salad_item.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String _selectedValue = 'hottest';
  String? username = '';

  Future<void> loadUsername() async {
    final prefsService = SharedPrefsServices();
    final name = await prefsService.getUsername();
    setState(() {
      username = name;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:
            // Shop Page Main Display
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            final SaladItem salad = saladItemList[index];
                            return MyRecommendedList(
                              name: salad.name,
                              price: salad.price,
                              imageAssets: salad.imageAssets,
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
                  child: SegmentedButton(
                    segments: [
                      // Hottest Category
                      ButtonSegment(
                        value: 'Hottest',
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Icon(Icons.whatshot),
                            ),
                            Text('Hottest'),
                          ],
                        ),
                      ),

                      // Popular Category
                      ButtonSegment(
                        value: 'Popular',
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Icon(Icons.trending_up),
                            ),
                            Text('Popular'),
                          ],
                        ),
                      ),

                      // New Combo
                      ButtonSegment(
                        value: 'New',
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Icon(Icons.auto_awesome),
                            ),
                            Text('New'),
                          ],
                        ),
                      ),
                    ],
                    selected: <String>{_selectedValue},
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        _selectedValue = newSelection.first;
                      });
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
