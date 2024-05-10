// land_records_page.dart
import 'package:flutter/material.dart';
import 'land_record.dart';
import 'edit_land.dart'; // Import the EditLandPage

class LandRecordsPage extends StatefulWidget {
 final List<LandRecord> landRecords;

 LandRecordsPage({required this.landRecords});

 @override
 _LandRecordsPageState createState() => _LandRecordsPageState();
}

class _LandRecordsPageState extends State<LandRecordsPage> {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Land Records'),
      ),
      body: ListView.builder(
        itemCount: widget.landRecords.length,
        itemBuilder: (context, index) {
          final record = widget.landRecords[index];
          return ListTile(
            title: Text(record.landName),
            subtitle: Text('Alamat Lahan: ${record.address}\nLuas Area Lahan: ${record.areaSize}\nNomor Sertifikat Hak Milik: ${record.ownershipCertificate}\nNomor Sertifikat ISPO: ${record.ispoCertificate}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                 icon: Icon(Icons.edit),
                 onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditLandPage(
                          record: record,
                          onUpdate: (updatedRecord) {
                            // Update the record in the list
                            setState(() {
                              widget.landRecords[index] = updatedRecord;
                            });
                            // Optionally, update the database here
                          },
                        ),
                      ),
                    );
                 },
                ),
                IconButton(
                 icon: Icon(Icons.delete),
                 onPressed: () {
                    // Remove the record from the list
                    setState(() {
                      widget.landRecords.removeAt(index);
                    });
                    // Optionally, delete the record from the database here
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