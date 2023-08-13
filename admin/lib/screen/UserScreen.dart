import 'dart:html';
import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/api/api_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../SlidableButton.dart';

class UserScreen extends StatelessWidget {
  final dynamic userData;
  const UserScreen({this.userData});
  @override
  Widget build(BuildContext context) {
    print("User data:");
    print(userData);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Expanded(
            child: GiftList(
              data: userData,
            ),
          ),
        ],
      ),
    );
  }
}

class GiftList extends StatelessWidget {
  final dynamic data;
  const GiftList({this.data});

  Widget build(BuildContext context) {
    List<Widget> messageList = [];
    data.forEach((item) {
      messageList.add(NotificationNOption(data: item));
    });
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: messageList,
      ),
    );
    ;
  }
}

class NotificationNOption extends StatelessWidget {
  final dynamic data;
  const NotificationNOption({this.data});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: NotificationItem(data: data),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableButton(
            onPressed: (context) {
              print('Read');
            },
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icons.check,
            iconSize: 30,
            foregroundColor: Colors.white,
          ),
          SlidableButton(
            onPressed: (context) {
              print('Delete');
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            iconSize: 30,
            foregroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final dynamic data;
  const NotificationItem({this.data});
  Future<void> _showLockConfirmation(BuildContext context) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận khóa'),
          content: Text('Bạn có chắc muốn khóa tài khoản này ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No
              },
              child: Text('Không'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Yes
              },
              child: Text('Có'),
            ),
          ],
        );
      },
    );
    final ApiClient _apiClient = ApiClient();
    final storage = const FlutterSecureStorage();

    if (confirmed == true) {
      String token = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.banUser(token, data["id"]);
      print(res);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationLayout(
                    selectedScreen: 0,
                  )));
      // Perform delete operation here
    } else {
      print('Delete operation canceled');
    }
  }

  Future<void> _showActiveConfirmation(BuildContext context) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận kích hoạt'),
          content: Text('Bạn có chắc muốn kích hoạt tài khoản này ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No
              },
              child: Text('Không'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Yes
              },
              child: Text('Có'),
            ),
          ],
        );
      },
    );
    final ApiClient _apiClient = ApiClient();
    final storage = const FlutterSecureStorage();

    if (confirmed == true) {
      String token = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.activeUser(token, data["id"]);
      print(res);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigationLayout(
                    selectedScreen: 0,
                  )));
      // Perform delete operation here
    } else {
      print('Delete operation canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 7,
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tên: " + data["name"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      "Địa chỉ: " + data["address"],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      "Tổng điểm: " + data["totalPoint"].toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      "Nhày tạo: " + data["createdAt"].toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  child: ElevatedButton(
                      onPressed: () {
                        data["isActive"]
                            ? _showLockConfirmation(context)
                            : _showActiveConfirmation(context);
                      },
                      child: Icon(
                        !data["isActive"] ? Icons.lock_open : Icons.lock,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: data["isActive"]
                            ? Colors.red
                            : Colors.blue, // Background color
                      )))
            ],
          )
        ],
      ),
    );
  }
}
