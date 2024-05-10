import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_helper.dart'; // Import the land page
import 'profiledisplay.dart';
import 'profile_data.dart';


class ProfilePage extends StatefulWidget {
 @override
 _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 final _formKey = GlobalKey<FormState>();
 final _nameController = TextEditingController();
 final _roleController = TextEditingController();
 final _addressController = TextEditingController();

 @override
 void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _addressController.dispose();
    super.dispose();
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                 }
                 return null;
                },
              ),
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Role'),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                 }
                 return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                 }
                 return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                 onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String role = _roleController.text;
                      String address = _addressController.text;

                      // Insert the data into the database
                      _insertProfile(context, name, role, address);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                 },
                 child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }

 Future<void> _insertProfile(BuildContext context, String name, String role, String address) async {
 Map<String, dynamic> profile = {
    'name': name,
    'role': role,
    'address': address,
 };
 ProfileData.addProfile(profile);

 // Navigate to the new page after data insertion
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileDisplayPage()),
 );

 ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Data Saved Successfully')),
 );
}

}

class DatabaseHelper {
 static final _databaseName = "profile_database.db";
 static final _databaseVersion = 1;

 static final profileTable = 'profile';
 static final profileColumnId = '_id';
 static final profileColumnName = 'name';
 static final profileColumnRole = 'role';
 static final profileColumnAddress = 'address';

 // Singleton class
 DatabaseHelper._privateConstructor();
 static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

 // Database reference
 static late Database _database;

 // Getter for the database instance
 static Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
 }

 // Open the database and create tables
 static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: (db, version) {
      return db.execute('''
          CREATE TABLE $profileTable (
            $profileColumnId INTEGER PRIMARY KEY,
            $profileColumnName TEXT NOT NULL,
            $profileColumnRole TEXT NOT NULL,
            $profileColumnAddress TEXT NOT NULL
          )
          ''');
    });
 }
}
