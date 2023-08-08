import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/auth/OTP.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/component/validator.dart';
import 'package:loyalty/screen/auth/register.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _phone = "";
  String _province = "";
  String _district = "";
  String _ward = "";
  String _street = "";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // You can do something with the address data here, e.g., save to database or display a success message.
      print("Address submitted successfully!");
      print("Name: $_name");
      print("Phone: $_phone");
      print("Province: $_province");
      print("District: $_district");
      print("Ward: $_ward");
      print("Street: $_street");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Địa chỉ của tôi',
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
                decoration: InputDecoration(labelText: 'Tên người nhận'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Số điện thoại người nhận'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tỉnh/Thành Phố'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your province';
                  }
                  return null;
                },
                onSaved: (value) {
                  _province = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quận/Huyện'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your district';
                  }
                  return null;
                },
                onSaved: (value) {
                  _district = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phường/Xã'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ward';
                  }
                  return null;
                },
                onSaved: (value) {
                  _ward = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Đường/Số nhà/Thôn/Xóm'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your street';
                  }
                  return null;
                },
                onSaved: (value) {
                  _street = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Lưu lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
