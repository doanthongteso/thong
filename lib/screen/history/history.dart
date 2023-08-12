import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../SlidableButton.dart';

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({Key? key}) : super(key: key);
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[200],
//     );
//     Expanded(child: NotificationNOption());
//   }
// }

class HistoryScreen extends StatelessWidget {
  final dynamic data;
  const HistoryScreen({this.data});
  @override
  Widget build(BuildContext context) {
    print("History screen");
    print(data);
    return Column(
      children: [
        Container(
          height: 10,
        ),
        Expanded(
          child: NotificationList(data: data),
        ),
      ],
    );
  }
}

class NotificationList extends StatelessWidget {
  final dynamic data;
  const NotificationList({this.data});

  Widget build(BuildContext context) {
    print("notify");
    print(data);
    List<Widget> messageList = [];

    data.forEach((item) {
      messageList.add(NotificationItem(data: item));
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
                    image: NetworkImage('assets/images/logo.jpg'),
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
                    data["type"] == true
                        ? 'Tích điểm thành công +${data["point"]} Point '
                        : 'Đổi quà thành công -${data["point"]} Point',
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
                      data["createdAt"],
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
