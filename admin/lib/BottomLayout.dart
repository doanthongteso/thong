import 'package:admin/screen/GiftScreen.dart';
import 'package:admin/screen/NotificationScreen.dart';
import 'package:admin/screen/UserScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin/api/api_admin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BottomNavigationLayout extends StatefulWidget {
  @override
  BottomNavigationLayoutState createState() {
    return BottomNavigationLayoutState();
  }
}

class BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int currentSelectedIndex = 0;
  bool isSearch = false;

  final storage = const FlutterSecureStorage();
  final ApiClient _apiClient = ApiClient();

  dynamic userRes;
  dynamic data;
  dynamic historyData;
  dynamic giftHistoryData;
  dynamic notificationData;
  List<Widget> listScreens = [];
  bool isComplete = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String token = (await storage.read(key: 'accessToken')).toString();

    data = await _apiClient.getAllGift(token);

    userRes = await _apiClient.getAllUserData(token);

    notificationData = await _apiClient.getNotification(token);

    // print(data);
    setState(() {
      listScreens = <Widget>[
        UserScreen(userData: userRes["user"]),
        GiftScreen(giftData: data),
        // CreatePage(),
        NotificationScreen(notificationData: notificationData),
      ];
      isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: (isSearch)
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.black12),
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: (currentSelectedIndex == 0)
                                          ? 'Công thức hoặc thực đơn...'
                                          : 'Nhập từ khóa cần tìm...'),
                                ),
                              ),
                            )
                          : Container(
                              child: (currentSelectedIndex == 0)
                                  ? Logo()
                                  : Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        (currentSelectedIndex == 1)
                                            ? 'Quản lý quà tặng'
                                            : (currentSelectedIndex == 2)
                                                ? 'Quản lý thông báo'
                                                : '',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                    ),
                            ),
                    ),
                    Container(
                      child: (currentSelectedIndex == 2 ||
                              currentSelectedIndex == 4)
                          ? null
                          : Container(
                              child: (isSearch)
                                  ? TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isSearch = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(8),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isSearch = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(8),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Icon(
                                        Icons.logout_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                            ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: (isSearch)
                      ? Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: ListView.separated(
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50,
                                child: Text(
                                  'Hello ' + index.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                alignment: Alignment.centerLeft,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                          ),
                        )
                      : Container(
                          // child: SingleChildScrollView(
                          child: IndexedStack(
                            index: currentSelectedIndex,
                            children: listScreens,
                          ),
                          // scrollDirection: Axis.vertical,
                          // )
                        ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: (isSearch)
          ? null
          : Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelectedIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        (currentSelectedIndex != 0)
                            ? Icon(Icons.person_2_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.person_2_rounded,
                                color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelectedIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        (currentSelectedIndex != 1)
                            ? Icon(Icons.gif_box_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.gif_box_rounded,
                                color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      setState(() {
                        currentSelectedIndex = 2;
                      });
                    },
                    child: Column(
                      children: [
                        (currentSelectedIndex != 2)
                            ? Icon(Icons.notification_add_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.notification_add_rounded,
                                color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 10,
        ),
        Text(
          'Quản lý người dùng',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 51, 3, 242),
          ),
        ),
      ],
    );
  }
}
