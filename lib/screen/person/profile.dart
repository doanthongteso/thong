import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/auth/OTP.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/component/validator.dart';
import 'package:loyalty/screen/auth/register.dart';
import 'package:loyalty/screen/person/person.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic userProfile;
  EditProfileScreen({this.userProfile});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

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
    String _name = "${userProfile["name"]}";
    String _phone = "0123456789";
    String _address = "Cam Thanh, Cam Xuyen, Ha Tinh";
    _nameController.text = _name;
    _phoneController.text = _phone;
    _addressController.text = _address;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chỉnh sửa thông tin cá nhân',
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
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Họ tên'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration:
                    InputDecoration(labelText: 'Số điện thoại người nhận'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Địa chỉ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập địa chỉ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
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
                      MaterialPageRoute(builder: (context) => PersonScreen()),
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
