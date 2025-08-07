class SaladItem {
  String name;
  String price;
  String imageAssets;
  SaladItem({
    required this.name,
    required this.price,
    required this.imageAssets,
  });
}

var saladItemList = [
  SaladItem(
    name: 'Berry Manggo Combo',
    price: 'Rp. 25.000',
    imageAssets: 'assets/images/berry_manggo_combo.png',
  ),
  SaladItem(
    name: 'Honey Lime Combo',
    price: 'Rp. 25.000',
    imageAssets: 'assets/images/honey_lime_combo.png',
  ),
  SaladItem(
    name: 'Melon Fruit Combo',
    price: 'Rp. 25.000',
    imageAssets: 'assets/images/melon_fruit_combo.png',
  ),
  SaladItem(
    name: 'Quinoa Fruit Combo',
    price: 'Rp. 25.000',
    imageAssets: 'assets/images/quinoa_fruit_combo.png',
  ),
  SaladItem(
    name: 'Tropical Fruit Combo',
    price: 'Rp. 25.000',
    imageAssets: 'assets/images/tropical_fruit_combo.png',
  ),
];
