import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.yellow,
        //   appBar: AppBar(
        //   backgroundColor: Colors.yellow,
        //   title: Text('ABA'),
        //   actions: [
        //     Icon(Icons.chat),
        //     Icon(Icons.notifications),
        //     Icon(Icons.qr_code),
        //   ],
        // ),
          drawer: const Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Zorin"),
                  accountEmail: Text("Zorin@mail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ],
            )),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.unsw.edu.au/content/dam/images/graphics/logos/unsw/unsw_0.png', // Example logo
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'MAJOR INCIDENT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'RESPONSE APPLICATION',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to menu screen
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Set background color to black
                      padding: EdgeInsets.symmetric(horizontal: 180, vertical: 15), // Add padding for size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Add slight rounding on corners
                        side: BorderSide(color: Colors.orange, width: 3), // Orange border
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 16,                // Set font size
                        color: Colors.white,          // Set text color to white
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot password?'),
                  ),
                ],
              )
        )
      ),
    );
  }
}
