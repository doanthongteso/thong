import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../SlidableButton.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Expanded(
            child: GiftList(),
          ),
        ],
      ),
    );
  }
}

class GiftList extends StatelessWidget {
  List<Widget> messageList = [
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
    NotificationNOption(),
  ];

  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: NotificationItem(),
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

    if (confirmed == true) {
      // Perform delete operation here
      print('Item deleted');
    } else {
      print('Delete operation canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    'Tên người dùng',
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
                      'Địa chỉ : Cẩm Xuyên, Hà Tĩnh',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Point : 100',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Ngày tạo: 20/10/2020',
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
                      _showLockConfirmation(context);
                    },
                    child: Icon(Icons.lock_open)),
              )
            ],
          )
        ],
      ),
    );
  }
}
