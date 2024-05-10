import 'package:flutter/material.dart';
import 'database_helper.dart'; // Import your database helper

// EditProfilePage.dart
class EditProfilePage extends StatefulWidget {
  final Map<String, String?> profileData;

  EditProfilePage({required this.profileData});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _roleController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profileData['name']);
    _roleController = TextEditingController(text: widget.profileData['role']);
    _addressController = TextEditingController(text: widget.profileData['address']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _roleController, decoration: InputDecoration(labelText: 'Role')),
            TextField(controller: _addressController, decoration: InputDecoration(labelText: 'Address')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': _nameController.text,
                  'role': _roleController.text,
                  'address': _addressController.text,
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}