// item_page.dart

import 'package:blublushope/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.imageUrl,
              height: 500, // Adjust the height as needed
              width:
                  500, // Set to double.infinity to use the maximum available width
              fit: BoxFit.cover, // Use BoxFit.cover to cover the entire space
            ),
            SizedBox(height: 16),
            Text('Name: ${item.name}'),
            SizedBox(height: 8),
            Text('Price: ${item.price}'),
            SizedBox(height: 8),
            Text('Description: ${item.description}'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}