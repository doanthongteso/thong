import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/screen/GiftScreen.dart';
import 'package:flutter/material.dart';

import 'package:admin/component/validator.dart';

class CreateNotificationScreen extends StatelessWidget {
  TextEditingController _nameNotiController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  final _formKey = GlobalKey<FormState>();

  @override
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // You can do something with the address data here, e.g., save to database or display a success message.
      // print("Address submitted successfully!");
      // print("Name: $_name");
      // print("Phone: $_phone");
      // print("Province: $_address");
    }
  }

  @override
  Widget build(BuildContext context) {
    String _nameNoti = "";
    String _content = "";

    // _nameController.text = _name;
    // _phoneController.text = _phone;
    // _addressController.text = _address;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tạo thông báo',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameNotiController,
                decoration: InputDecoration(labelText: 'Tên thông báo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng tên thông báo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nameNoti = value!;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Nội dung thông báo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung thông báo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  //onPressed: registerUsers ,

                  onPressed: () => {
                    //registerUsers(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationLayout()),
                    ),
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15)),
                  child: const Text(
                    "Lưu thông tin",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
