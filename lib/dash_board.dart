import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(
                'https://coolbeans.sgp1.digitaloceanspaces.com/legend-cinema-prod/37c1b050-709f-40fe-b374-23c2035177bb.jpeg',
                width: 400,
              ),
            ),
          ]
      ),
    )
        )
    );
  }
}
