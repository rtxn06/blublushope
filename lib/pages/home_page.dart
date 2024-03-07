// homepage.dart

import 'package:blublushope/models/item.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Item> items = [
    Item(
        name: 'Sepatu',
        price: 1500000,
        description: 'Sepatu Olahraga',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiXn4FrE9h1wSaUKZm6eSYw1A10OyZFVyWVQ&s'),
    Item(
        name: 'Flatshoes',
        price: 900000,
        description: 'Flatshoes Wanita',
        imageUrl:
            'https://media2.newlookassets.com/i/newlook/607474912/womens/footwear/shoes/off-white-faux-croc-bow-ballet-pumps.jpg?strip=true&qlt=50&w=720')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blublu Shop"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _navigateToAddItem(context);
            },
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded
                      (child: Image.network(
                        item.imageUrl,
                        height: 100,
                        width: 300,
                        fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle (fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text(
                              item.price.toString(),
                              textAlign: TextAlign.end,
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddItem(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddItem(BuildContext context) async {
    final addedItem = await Navigator.pushNamed(context, '/add-item');
    if (addedItem != null && addedItem is Item) {
      setState(() {
        items.add(addedItem);
      });
    }
  }
}