import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'editprofile.dart';
import 'profile_data.dart';

class ProfileDisplayPage extends StatefulWidget {
  @override
  _ProfileDisplayPageState createState() => _ProfileDisplayPageState();
}

class _ProfileDisplayPageState extends State<ProfileDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Data'),
      ),
      body: ListView.builder(
        itemCount: ProfileData.profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ProfileData.profiles[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ProfileData.profiles[index]['role']),
                Text(ProfileData.profiles[index]['address']),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    Map<String, String?> profileData = {
                      'name': ProfileData.profiles[index]['name'],
                      'role': ProfileData.profiles[index]['role'],
                      'address': ProfileData.profiles[index]['address'],
                    };
                    final editedData = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage(profileData: profileData)),
                    );
                    if (editedData != null) {
                      setState(() {
                        ProfileData.profiles[index]['name'] = editedData['name']!;
                        ProfileData.profiles[index]['role'] = editedData['role']!;
                        ProfileData.profiles[index]['address'] = editedData['address']!;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ProfileData.deleteProfile(index);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}