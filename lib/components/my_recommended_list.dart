import 'package:flutter/material.dart';

class MyRecommendedList extends StatefulWidget {
  final String name;
  final String price;
  final String imageAssets;

  const MyRecommendedList({
    super.key,
    required this.name,
    required this.price,
    required this.imageAssets,
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
                    Text(widget.name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.price),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
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
