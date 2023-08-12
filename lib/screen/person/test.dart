import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // Example data loaded from an API or other source
  String _initialName = "John Doe";
  String _initialPhone = "1234567890";
  String _initialAddress = "123 Main Street, City";

  @override
  void initState() {
    super.initState();
    _nameController.text = _initialName;
    _phoneController.text = _initialPhone;
    _addressController.text = _initialAddress;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // You can save the changes to your database or perform any other actions here.
    String newName = _nameController.text;
    String newPhone = _phoneController.text;
    String newAddress = _addressController.text;

    print("Name: $newName");
    print("Phone: $newPhone");
    print("Address: $newAddress");

    // You can also show a success message or navigate back to the profile screen.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
