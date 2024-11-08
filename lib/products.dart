import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      home: ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products = [
    Product('Nike Yellow', 25.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9d69ebb5-8bb1-4126-a50b-b4c4acb204de/WMNS+AIR+JORDAN+1+MID.png'),
    Product('Nike Air Max 270 GO', 29.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a7d6b134-0f2e-4012-b431-f831fc6e2c70/COURT+BOROUGH+MID+2+%28GS%29.png'),
    Product('Nike SFB B1', 20.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/66fb40da-e5dd-4624-a6de-8e6e48ea177a/WMNS+NIKE+WAFFLE+DEBUT+VNTG.png'),
    Product('Ja 1 "Vacation"', 99.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/60bfe3b9-097d-4857-aad2-2ecec8850f63/JA+1.png'),
    Product('KD17', 30.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/85a8eb23-069c-419e-9a3a-2ddb8749e8f3/W+NIKE+AIR+MAX+PORTAL.png'),
    Product('Nike Structure 25', 19.0, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/c626a1ef-ebae-47b2-be6b-8706be6b95e5/AIR+FORCE+1+LOW+EVO.png'),
    // Add more products here with valid image URLs
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {}),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (ctx, i) => ProductItem(products[i]),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailScreen(product),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(product.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.name),
            ),
            Text('\$${product.price}'),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(product.name),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              product.image,
              height: 500, // Adjust the height as needed
              fit: BoxFit.contain, // Ensure the image fits properly
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Make name bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Flutter: Bubble tab indicator for TabBar. Using a Stack Widget and then adding elements to stack on different levels (stacking components like Tabs, above).', // Description or placeholder text
              style: TextStyle(fontSize: 14, color: Colors.grey[600]), // Smaller, greyish font
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between amount and button
                children: [
                  Text(
                    'Total Amount: \$${product.price}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Similar font styling
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Remove cart functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue background for the button
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjust padding to match button size
                    ),
                    child: Text(
                      'REMOVE CART',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), // Text in white, bold
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product(this.name, this.price, this.image);
}
