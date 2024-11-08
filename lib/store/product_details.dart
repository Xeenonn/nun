import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final int data;

  // Constructor to accept data
  DetailScreen({required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedIndex = 0;  // Track the selected index for the bottom navigation

  // Fetch product details from the API
  Future<Map> _getProductDetail() async {
    var url = Uri.parse("http://192.168.1.13:5050/products/${widget.data}");
    var response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }

  // Handle item selection in the BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map>(
              future: _getProductDetail(), // Fetch the product detail
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 5,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No data found'));
                } else {
                  return Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${snapshot.data!['image']}",
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${snapshot.data!['title']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${snapshot.data!['description']}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Icon(
                          Icons.favorite_border, // or Icons.favorite if already liked
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomSheet: FutureBuilder<Map>(
        future: _getProductDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink(); // Just return an empty space while loading
          }

          return Container(
            height: 80,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  // Price from the API (assuming it’s in snapshot['price'])
                  Text(
                    '\$${snapshot.hasData ? snapshot.data!['price'] : '0.00'}', // Display price dynamically
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button action here (e.g., add to cart, etc.)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item added to cart')),
                      );
                    },
                    child: Text('Remove Card'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
