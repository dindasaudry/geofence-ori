import 'package:flutter/material.dart';
import 'land_record.dart';

class EditLandPage extends StatefulWidget {
 final LandRecord record;
 final Function(LandRecord) onUpdate;

 EditLandPage({required this.record, required this.onUpdate});

 @override
 _EditLandPageState createState() => _EditLandPageState();
}

class _EditLandPageState extends State<EditLandPage> {
 final _formKey = GlobalKey<FormState>();
 late TextEditingController _landNameController;
 late TextEditingController _addressController;
 late TextEditingController _areaSizeController;
 late TextEditingController _ownershipCertificateController;
 late TextEditingController _ispoCertificateController;

 @override
 void initState() {
    super.initState();
    _landNameController = TextEditingController(text: widget.record.name);
    _addressController = TextEditingController(text: widget.record.address);
    _areaSizeController = TextEditingController(text: widget.record.areaSize);
    _ownershipCertificateController = TextEditingController(text: widget.record.ownershipCertificate);
    _ispoCertificateController = TextEditingController(text: widget.record.ispoCertificate);
 }

 @override
 void dispose() {
    _landNameController.dispose();
    _addressController.dispose();
    _areaSizeController.dispose();
    _ownershipCertificateController.dispose();
    _ispoCertificateController.dispose();
    super.dispose();
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Land Record'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _landNameController,
              decoration: InputDecoration(labelText: 'Nama Lahan'),
            ),
             TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat Lahan'),
            ),
            TextFormField(
              controller: _areaSizeController,
              decoration: InputDecoration(labelText: 'Luas Area Lahan'),
            ),
            TextFormField(
              controller: _ownershipCertificateController,
              decoration: InputDecoration(labelText: 'Nomor Sertifikat Hak Milik'),
            ),
            TextFormField(
              controller: _ispoCertificateController,
              decoration: InputDecoration(labelText: 'Nomor Sertifikat ISPO'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                 widget.onUpdate(LandRecord(
                    landName: _landNameController.text,
                    address: _addressController.text,
                    areaSize: _areaSizeController.text,
                    ownershipCertificate: _ownershipCertificateController.text,
                    ispoCertificate: _ispoCertificateController.text,
                 ));
                 Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
 }
}