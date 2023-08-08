import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/screen/home/exchangeGiftInfo.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class RecipeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 3 * MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("assets/images/banner1.png"),
                    fit: BoxFit.cover)),
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
                          'Tên quà tặng',
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
                                        image: NetworkImage(
                                            "assets/images/banner1.png"),
                                        fit: BoxFit.cover)),
                              ),
                              Text(
                                'Nhà phân phối',
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
                                    'Còn lại 999',
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
                            'Đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả.\nĐoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả đoạn mô tả.',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExchangeGiftInfo()),
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
