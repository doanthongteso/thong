import 'dart:ui';
import 'package:admin/screen/createNotification.dart';
import 'package:admin/screen/editNotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:loyalty/api/api_clients.dart';
// import 'package:loyalty/screen/auth/OTP.dart';
// import 'package:loyalty/screen/auth/login_screen.dart';
// import 'package:loyalty/component/validator.dart';
// import 'package:loyalty/screen/auth/register.dart';

import '../SlidableButton.dart';

class NotificationScreen extends StatelessWidget {
  final dynamic notificationData;
  const NotificationScreen({this.notificationData});
  @override
  Widget build(BuildContext context) {
    print("Noti data:");
    print(notificationData);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CreateNotificationScreen();
                    },
                  ));
                },
                child: const Text('Tạo mới')),
          ),
          Expanded(
            child: GiftList(
              data: notificationData,
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
  @override
  Future<void> _showDeleteConfirmation(BuildContext context) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc muốn xóa quà tặng này ?'),
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

    if (confirmed == true) {
      // Perform delete operation here
      print('Item deleted');
    } else {
      print('Delete operation canceled');
    }
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    '${data["title"]}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Nội dung: ${data["description"]}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Ngày tạo: ${data["createdAt"]}',
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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return EditNotificationScreen();
                        },
                      ));
                    },
                    child: Icon(Icons.edit)),
              ),
              SizedBox(height: size.height * 0.01),
              ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmation(context);
                  },
                  child: Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
  }
}
