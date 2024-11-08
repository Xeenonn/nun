import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'product_details.dart';

void main() {
  runApp(FakeStore());
}

class FakeStore extends StatelessWidget {
  const FakeStore({super.key});

  Future<List> _getProduct() async {
    var url = Uri.parse("http://192.168.1.13:5050/products");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.store),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.add),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: FutureBuilder<List>(
            future: _getProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == null) {
                return Center(
                  child: Text("No data"),
                );
              }
              if (snapshot.data != null) {
                var product = snapshot.data!;
                return GridView.builder(
                  itemCount: product.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Number of items per row
                    crossAxisSpacing: 10.0,
                    // Horizontal spacing between grid items
                    mainAxisSpacing: 10.0,
                    // Vertical spacing between grid items
                    childAspectRatio: 0.75, // Aspect ratio of grid items
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(data:  product[index]['id']),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  product[index]['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product[index]['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                "${product[index]['price'].toString()} \$",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const Text("No widget to build");
            }),
      ),
    );
  }
}