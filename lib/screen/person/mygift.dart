import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/auth/OTP.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/component/validator.dart';
import 'package:loyalty/screen/auth/register.dart';

import '../SlidableButton.dart';

class MyGiftScreen extends StatelessWidget {
  final dynamic data;
  const MyGiftScreen({this.data});
  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quà của tôi',
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
      body: Column(
        children: [
          Container(
            height: 10,
          ),
          Expanded(
            child: GiftList(data: data),
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
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(data["gift"]["imgUrl"]),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data["gift"]["name"],
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
                      data["gift"]["vendor"],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  data["cardId"] != null
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            'Mã thẻ cào : ${data["card"]["code"]}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Ngày đổi quà : ${data["createdAt"]}',
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       height: 10,
          //       width: 10,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Theme.of(context).primaryColor),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
