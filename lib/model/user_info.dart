import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  String title;
  String subTitle;
  IconData icon;

  UserInfo({required this.title, required this.subTitle, required this.icon});
}

var info = [
  UserInfo(title: '0', subTitle: 'Order', icon: Icons.star),
  UserInfo(title: '0', subTitle: 'Level', icon: Icons.emoji_events),
  UserInfo(title: '0', subTitle: 'Cart', icon: Icons.shopping_cart),
  UserInfo(title: '0', subTitle: 'Favorite', icon: Icons.favorite),
];
