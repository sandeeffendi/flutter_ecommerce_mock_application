import 'package:flutter/material.dart';

class MyRecommendedList extends StatefulWidget {
  final String name;
  final String price;
  final String imageAssets;
  final void Function()? onTap;

  const MyRecommendedList({
    super.key,
    required this.name,
    required this.price,
    required this.imageAssets,
    required this.onTap,
  });

  @override
  State<MyRecommendedList> createState() => _MyRecommendedListState();
}

class _MyRecommendedListState extends State<MyRecommendedList> {
  bool isFavorite = false;

  void setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    setFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(2),
      child: ClipRRect(
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                setFavorite();
              },
              icon: Icon(
                isFavorite ? Icons.favorite_outline : Icons.favorite,
                color: Colors.red,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(widget.imageAssets),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 27, 49),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.price,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 0, 27, 49),
                              ),
                        ),
                        IconButton(
                          onPressed: widget.onTap,
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
