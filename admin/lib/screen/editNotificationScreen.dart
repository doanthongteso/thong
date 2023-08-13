import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/api/api_admin.dart';
import 'package:admin/screen/GiftScreen.dart';
import 'package:flutter/material.dart';

import 'package:admin/component/validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EditNotificationScreen extends StatelessWidget {
  final dynamic data;
  const EditNotificationScreen({this.data});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameNotiController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    @override
    final _formKey = GlobalKey<FormState>();

    void updateNotification() async {
      final ApiClient _apiClient = ApiClient();
      final storage = const FlutterSecureStorage();

      String token = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.editNotification(token, data["id"], {
        "title": _nameNotiController.text,
        "description": _contentController.text
      });
      print(res);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationLayout(
                    selectedScreen: 2,
                  )));
    }

    String _nameNoti = data["title"];
    String _content = data["description"];

    _nameNotiController.text = _nameNoti;
    _contentController.text = _content;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sửa thông báo',
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
                    updateNotification(),
                    
                    //registerUsers(),
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
