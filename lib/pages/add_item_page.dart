// add_item_page.dart

import 'package:blublushope/models/item.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addItem(context);
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }

  void _addItem(BuildContext context) {
    String name = nameController.text;
    int price = int.tryParse(priceController.text) ?? 0;
    String description = descriptionController.text;
    String imageUrl = imageUrlController.text;

    if (name.isNotEmpty && price > 0 && description.isNotEmpty) {
      Navigator.pop(
        context,
        Item(
            name: name,
            price: price,
            description: description,
            imageUrl: imageUrl),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields with valid values.'),
        ),
      );
    }
  }
}