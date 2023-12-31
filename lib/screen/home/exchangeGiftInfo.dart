import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/BottomNavigationLayout.dart';
import 'package:loyalty/screen/auth/OTP.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/component/validator.dart';
import 'package:loyalty/screen/auth/register.dart';
import 'package:loyalty/screen/home/home_test.dart';
import 'package:loyalty/screen/person/myadress.dart';
import 'package:loyalty/screen/person/mygift.dart';

class ExchangeGiftInfo extends StatefulWidget {
  final dynamic giftData;
  final dynamic userData;
  const ExchangeGiftInfo({this.giftData, this.userData});
  @override
  _ExchangeGiftInfoState createState() => _ExchangeGiftInfoState();
}

class _ExchangeGiftInfoState extends State<ExchangeGiftInfo> {
  final ApiClient _apiClient = ApiClient();
  final storage = const FlutterSecureStorage();
  void _changeReceiverInformation() {
    // You can add code to open a form/dialog to change receiver information here.
    // For simplicity, we are using a dummy data update here.
    // setState(() {
    //   _receiverName = "Jane Doe";
    //   _receiverPhone = "9876543210";
    //   _receiverAddress = "456 Park Avenue, Town";
    // });
  }

  void _continueToNextScreen() {
    // You can navigate to the next screen or perform other actions here.
    print("Continue button pressed!");
  }

  void _showSuccessPopup() async {
    String token = (await storage.read(key: 'accessToken')).toString();
    dynamic res = await _apiClient.exchangeGift(token, widget.giftData["id"]);
    print(res);
    if (res["message"] == "Success") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Đổi quà thành công'),
            content: Text('Quà của bạn sẽ sớm được vận chuyển đến bạn'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationLayout()),
                  );
                },
                child: Text('Về trang chủ'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Đổi quà thất bại'),
            content: Text('Có một số lỗi xảy ra, vui lòng thử lại.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationLayout()),
                  );
                },
                child: Text('Về trang chủ'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.giftData);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin nhận quà',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Thông tin người nhận',
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                widget.userData["name"],
                style: TextStyle(
                  fontSize: 16,
                  //color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                '0855978726',
                style: TextStyle(
                  fontSize: 16,
                  //color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                widget.userData["address"],
                style: TextStyle(
                  fontSize: 16,
                  //color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressScreen()),
                );
              },
              child: Text(
                'Thay đổi địa chỉ',
                style: TextStyle(
                  fontSize: 16,
                  //color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 7,
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.giftData["imgUrl"]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.giftData["name"],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.giftData["vendor"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .unselectedWidgetColor),
                                    ),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      size: 16,
                                      color: Theme.of(context)
                                          .unselectedWidgetColor,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Miễn phí vận chuyển',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: size.height * 0.06),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //onPressed: registerUsers ,

                onPressed: () => {
                  _showSuccessPopup(),
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20)),
                child: const Text(
                  "Hoàn Tất",
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
    );
  }
}
