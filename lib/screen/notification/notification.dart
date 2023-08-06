// import 'package:cookiez/CarouselSlider.dart';
// import 'package:cookiez/SlidableButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../SlidableButton.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterNotification(),
        Container(
          height: 10,
        ),
        Expanded(
          child: NotificationList(),
        ),
      ],
    );
  }
}

class FilterNotification extends StatefulWidget {
  @override
  State<FilterNotification> createState() => _FilterNotificationState();
}

class _FilterNotificationState extends State<FilterNotification> {
  int modeSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              setState(() {
                modeSelected = 0;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (modeSelected != 0)
                      ? Colors.black12
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                'Tất cả',
                style: TextStyle(
                    color: (modeSelected != 0) ? Colors.black54 : Colors.white),
              ),
            )),
        TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              setState(() {
                modeSelected = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (modeSelected != 1)
                      ? Colors.black12
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                'Chưa đọc',
                style: TextStyle(
                    color: (modeSelected != 1) ? Colors.black54 : Colors.white),
              ),
            )),
        TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              setState(() {
                modeSelected = 2;
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (modeSelected != 2)
                      ? Colors.black12
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                'Đã đọc',
                style: TextStyle(
                    color: (modeSelected != 2) ? Colors.black54 : Colors.white),
              ),
            )),
      ],
    );
  }
}

class NotificationList extends StatelessWidget {
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
                    image: NetworkImage(
                        'https://images.viblo.asia/fe08fd0e-bf25-4a5a-b7e5-9dca33cfc692.png'),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Noi dung thong bao noi dung thong bao, noi dung thong bao. Noi dung thong bao noi dung thong bao, noi dung thong bao. ',
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
                      '13:01',
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
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
