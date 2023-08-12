// import 'package:cookiez/screens/CreatePage.dart';
// import 'package:cookiez/screens/HomePage.dart';
// import 'package:cookiez/screens/MessagePage.dart';
// import 'package:cookiez/screens/NotificationPage.dart';
// import 'package:cookiez/screens/Person.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/history/history.dart';
import 'package:loyalty/screen/person/person.dart';
import 'package:loyalty/screen/person/profile.dart';
import 'package:loyalty/screen/scan/scan.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home/home_test.dart';
import 'notification/notification.dart';

class BottomNavigationLayout extends StatefulWidget {
  @override
  BottomNavigationLayoutState createState() {
    return BottomNavigationLayoutState();
  }
}

class BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  final storage = const FlutterSecureStorage();
  final ApiClient _apiClient = ApiClient();

  int currentSelectedIndex = 0;
  bool isSearch = false;
  List<Widget> listScreens = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    dynamic userRes;
    dynamic data;
    dynamic historyData;

    String token = (await storage.read(key: 'accessToken')).toString();
    data = await _apiClient.getAllGift(token);

    userRes = await _apiClient.getUserProfileData(token);

    historyData = await _apiClient.getUserHistoryPoint(token);
    // print(data);
    setState(() {
      listScreens = <Widget>[
        HomePage(data: data, userProfile: userRes["user"]),
        HistoryScreen(data: historyData),
        ScanScreen(),
        // CreatePage(),
        NotificationPage(),
        PersonScreen(userProfile: userRes["user"])
      ];
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
                                            ? 'Lịch sử giao dịch'
                                            : (currentSelectedIndex == 2)
                                                ? "Tích điểm"
                                                : (currentSelectedIndex == 3)
                                                    ? 'Thông báo'
                                                    : 'Cá nhân',
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
                                          isSearch = true;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(8),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Icon(
                                        Icons.search,
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
                            ? Icon(Icons.home_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.home_rounded,
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
                            ? Icon(Icons.history_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.history_rounded,
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
                            ? Icon(Icons.qr_code_scanner_outlined,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.qr_code_2_rounded,
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
                        currentSelectedIndex = 3;
                      });
                    },
                    child: Column(
                      children: [
                        (currentSelectedIndex != 3)
                            ? Icon(Icons.notifications_none_rounded,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.notifications_rounded,
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
                        currentSelectedIndex = 4;
                      });
                    },
                    child: Column(
                      children: [
                        (currentSelectedIndex != 4)
                            ? Icon(Icons.person_outline_rounded,
                                color: Theme.of(context).unselectedWidgetColor)
                            : Icon(Icons.person,
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
        Padding(
          padding: EdgeInsets.zero,
          child: Image.asset('assets/images/logo.jpg'),
        ),
        Container(
          width: 10,
        ),
        Text(
          'Loyalty App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
