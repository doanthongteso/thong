import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/BottomNavigationLayout.dart';
import 'package:loyalty/screen/home/exchangeGiftInfo.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class RecipeDetails extends StatelessWidget {
  final dynamic data;
  final dynamic userData;
  const RecipeDetails({this.data, this.userData});

  @override
  Widget build(BuildContext context) {
    final ApiClient _apiClient = ApiClient();
    final storage = const FlutterSecureStorage();
    void cardExchange() async {
      String token = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.exchangeGift(token, data["id"]);
      print(res);
      if (res["message"] == "Success") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Đổi quà thành công'),
              content: Text('Mã thẻ: ${res["card"]["code"]}'),
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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 3 * MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data["imgUrl"]), fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('More');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: SolidBottomSheet(
        headerBar: Container(height: 0),
        body: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child:
                          ListView(scrollDirection: Axis.vertical, children: [
                        Text(
                          data["name"],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(data["imgUrl"]),
                                        fit: BoxFit.cover)),
                              ),
                              Text(
                                data["vendor"],
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                      size: 24,
                                    ),
                                  ),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  )
                                ],
                              ),
                              Container(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(Icons.calendar_today,
                                        size: 20,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  Text(
                                    'Còn lại ${data['totalCount'].toString()}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 8),
                        //   child: Text(
                        //     'Dành cho: 6 người',
                        //     style: TextStyle(
                        //         fontSize: 16,
                        //         color: Theme.of(context).primaryColorDark),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 8),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'Đánh giá: ',
                        //         style: TextStyle(
                        //             fontSize: 16,
                        //             color: Theme.of(context).primaryColorDark),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                        //         child: Text(
                        //           'Tốt cho sức khỏe',
                        //           style: TextStyle(
                        //               fontSize: 14, color: Colors.white),
                        //         ),
                        //         decoration: BoxDecoration(
                        //           shape: BoxShape.rectangle,
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(50)),
                        //           color: Colors.green,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 8),
                        //   child: Text(
                        //     'Nguyên liệu',
                        //     style: TextStyle(
                        //         fontSize: 16,
                        //         color: Theme.of(context).primaryColorDark,
                        //         fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Mô tả',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            data["description"],
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    data["category"] == "Card"
                        ? cardExchange()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExchangeGiftInfo(
                                      giftData: data,
                                      userData: userData,
                                    )),
                          );
                  },
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                        child: Text(
                      'Đổi quà',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
        minHeight: MediaQuery.of(context).size.height / 2,
        draggableBody: true,
        maxHeight: 17 * MediaQuery.of(context).size.height / 20,
      ),
    );
  }
}
