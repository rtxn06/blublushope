// main.dart

import 'package:blublushope/models/item.dart';
import 'package:blublushope/pages/add_item_page.dart';
import 'package:blublushope/pages/home_page.dart';
import 'package:blublushope/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => homepage(),
      '/item': (context) {
        final Item item = ModalRoute.of(context)!.settings.arguments as Item;
        return ItemPage(item: item);
      },
      '/add-item': (context) => AddItemPage(),
    },
  )
  );
}