import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/auth/OTP.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/component/validator.dart';
import 'package:loyalty/screen/auth/register.dart';

import '../SlidableButton.dart';

// class MyGiftScreen extends StatefulWidget {
//   @override
//   _MyGiftScreenState createState() => _MyGiftScreenState();
// }

// class _MyGiftScreenState extends State<MyGiftScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Quà của tôi',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.black,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         width: 220,
//         height: 220,
//         padding: EdgeInsets.only(bottom: 10),
//         margin: EdgeInsets.all(6),
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 blurRadius: 10,
//                 offset: Offset(0, 1), // changes position of shadow
//               ),
//             ]),
//         child: Column(
//           children: [
//             Container(
//               width: 220,
//               height: 130,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage("assets/images/logo.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20))),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Tên quà tặng',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 2.5,
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Nhà phân phối',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.blueGrey),
//                     ),
//                   ),
//                   Container(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.money,
//                             size: 16,
//                           ),
//                           Container(
//                             width: 5,
//                           ),
//                           Text(
//                             '6',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.black87),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             size: 16,
//                             color: Colors.orangeAccent,
//                           ),
//                           Container(
//                             width: 5,
//                           ),
//                           Text(
//                             '999',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.black87),
//                           )
//                         ],
//                       ),
//                       Container(
//                         padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
//                         child: Text(
//                           'Tốt cho sức khỏe',
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                           color: Colors.green,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class MyGiftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'Tên quà tặng',
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
                      'Nhà phân phối',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Mã thẻ cào : 12345678910',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Ngày đổi quà : 20/10/2020',
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
