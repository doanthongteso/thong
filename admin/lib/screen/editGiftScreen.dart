import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/screen/GiftScreen.dart';
import 'package:flutter/material.dart';

import 'package:admin/component/validator.dart';

class EditGiftScreen extends StatelessWidget {
  TextEditingController _nameGiftController = TextEditingController();
  TextEditingController _vendorController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  TextEditingController _pointController = TextEditingController();
  TextEditingController _totalController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

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
    String _nameGift = "Quà con gấu";
    String _vendor = "Bách Hóa Xanh";
    String _link = "123123";
    int _point;
    int _total;
    String _description = "Đây là mô tả";
    _nameGiftController.text = _nameGift;
    _vendorController.text = _vendor;
    //_pointController.text = _point;
    _linkController.text = _link;
    _descriptionController.text = _description;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sửa quà tặng',
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
                controller: _nameGiftController,
                decoration: InputDecoration(labelText: 'Tên quà tặng'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng quà tặng';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nameGift = value!;
                },
              ),
              TextFormField(
                controller: _vendorController,
                decoration: InputDecoration(labelText: 'Nhà phân phối'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nhà phân phối';
                  }
                  return null;
                },
                onSaved: (value) {
                  _vendor = value!;
                },
              ),
              TextFormField(
                controller: _linkController,
                decoration: InputDecoration(labelText: 'Link hình ảnh'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập Link hình ảnh';
                  }
                  return null;
                },
                onSaved: (value) {
                  _link = value!;
                },
              ),
              TextFormField(
                controller: _pointController,
                decoration: InputDecoration(labelText: 'Point'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập Point';
                  }
                  return null;
                },
                onSaved: (value) {
                  //_point = value!;
                },
              ),
              TextFormField(
                controller: _totalController,
                decoration: InputDecoration(labelText: 'Số lượng'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số lượng';
                  }
                  return null;
                },
                onSaved: (value) {
                  // _total = value!;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Mô tả'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mô tả';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
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