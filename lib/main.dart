import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatelessWidget {
  final List<Map<String, String>> clothingItems = [
    {
      'name': 'Black T-Shirt',
      'image': 'https://customprintedshirts.co.uk/wp-content/uploads/2021/05/01.jpg',
      'description': 'A comfortable cotton-made t-shirt. Available in all sizes.',
      'price': '\$20'
    },
    {
      'name': 'Wide Leg Jeans',
      'image': 'https://shopduer.com/cdn/shop/products/WFMS5321-Midweight-Denim-HR-Wide-Leg-Vintage-Blue-Front-990312.jpg?v=1707044496',
      'description': 'Classic wide leg blue denim jeans. Available in all sizes.',
      'price': '\$40'
    },
    {
      'name': 'Puffer Jacket',
      'image': 'https://static.e-stradivarius.net/assets/public/c8bc/a35c/4e6e4ba49ab2/e7e7c8709e1e/05606218430-a2/05606218430-a2.jpg?ts=1730193285690&w=1082',
      'description': 'A warm winter puffer jacket. Available in all sizes.',
      'price': '\$100'
    },
    {
      'name': 'Elegant Dress',
      'image': 'https://static.e-stradivarius.net/5/static2/itxwebstandard/images/visual_filters/1020035501.jpg?20241126020702=&imwidth=95&impolicy=stradivarius-itxmediumhigh&imformat=chrome&imdensity=2.625',
      'description': 'Elegant cotton-made dress for different occasions. Available in all sizes.',
      'price': '\$30'
    },
    {
      'name': 'Red Shirt',
      'image': 'https://static.e-stradivarius.net/assets/public/73cf/65ce/c67f46f28eab/6d4b5d8b84b7/02027559150-c/02027559150-c.jpg?ts=1727705237855&w=1082',
      'description': 'Elegant red button shirt. Available in all sizes.',
      'price': '\$25'
    },
    {
      'name': 'Black Fur Coat',
      'image': 'https://static.e-stradivarius.net/5/static2/itxwebstandard/images/visual_filters/1020192037.jpg?20241125020004=&imwidth=95&impolicy=stradivarius-itxmediumhigh&imformat=chrome&imdensity=2.625',
      'description': 'Elegant black fur coat. Available in all sizes.',
      'price': '\$120'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213045'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  clothingItems[index]['image']!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                clothingItems[index]['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(clothingItems[index]['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothingDetailScreen(
                      item: clothingItems[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  ClothingDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    item['image']!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  item['name']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item['description']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: ${item['price']}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text('Buy Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
