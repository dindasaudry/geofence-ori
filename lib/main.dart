import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import the profile page
import 'land_page.dart'; // Import the land page
import 'addlandpage.dart'; // Import the land page
import 'land_records_page.dart';
import 'database_helper.dart'; // Import your DatabaseHelper

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(
            size: 20,
          ),
          backgroundColor: Color(0xFF4287f5),
          title: Text("Geofence App"),
          centerTitle: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LandRecordsPage(landRecords: [],)),
                      );
                    },
                    child: Text("Profile Kebun"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fixedSize: Size(200, 50),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LandPage()),
                      );
                    },
                    child: Text("Tambah Kebun"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fixedSize: Size(200, 50),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: Text("Profile"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fixedSize: Size(200, 50),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}