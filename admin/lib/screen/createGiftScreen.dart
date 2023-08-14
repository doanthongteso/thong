import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/api/api_admin.dart';
import 'package:admin/screen/GiftScreen.dart';
import 'package:flutter/material.dart';

import 'package:admin/component/validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreateGiftScreen extends StatefulWidget {
  @override
  _CreateGiftScreenState createState() => _CreateGiftScreenState();
}

class _CreateGiftScreenState extends State<CreateGiftScreen> {
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

  String? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    void createGift() async {
      final ApiClient _apiClient = ApiClient();
      final storage = const FlutterSecureStorage();

      String token = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.createGift(token, {
        "name": _nameGiftController.text,
        "totalCount": _totalController.text,
        "description": _descriptionController.text,
        "point": _pointController.text,
        "category": _selectedCategory,
        "vendor": _vendorController.text,
        "imgUrl": _linkController.text,
      });
      print(res);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationLayout(
                    selectedScreen: 1,
                  )));
    }

    String _nameGift = "";
    String _vendor = "";
    String _link = "";
    int _point;
    int _total;
    String _description = "";

    // _nameController.text = _name;
    // _phoneController.text = _phone;
    // _addressController.text = _address;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tạo quà tặng',
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
              Row(
                children: [
                  Text("Danh mục"),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    items: <String>['New', 'Hot', 'Card']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                ],
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
                    createGift()
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
