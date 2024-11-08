import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Slideshow Example'),
        ),
        body: Column(
          children: [
            // Horizontal slideshow section
            Container(
              height: 200,  // Adjust the height for the slideshow
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network('https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg'),
                  Image.network('https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg'),
                  Image.network('https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg'),
                ],
              ),
            ),
            Expanded(
              // Vertical scrollable content below
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg',
                          width: 400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg',
                          width: 400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg',
                          width: 400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg',
                          width: 400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.network(
                          'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/c22d5817-ca3c-4e6d-b119-68fd0f15f5f3.jpeg',
                          width: 400,
                        ),
                      ),
                      // Add more images or content below as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
