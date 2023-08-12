import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalty/screen/home/home.dart';
import 'package:loyalty/screen/person/changepassword.dart';
import 'package:loyalty/screen/person/myadress.dart';
import 'package:loyalty/screen/person/mygift.dart';
import 'package:loyalty/screen/person/profile.dart';

// class PersonScreen extends StatefulWidget {
//   //const PersonScreen({Key? key}) : super(key: key);

//   @override
//   State<PersonScreen> createState() => _PersonScreenState();
// }

class PersonScreen extends StatelessWidget {
  final dynamic userProfile;
  const PersonScreen({this.userProfile});
  // String accessToken =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMCwiZW1haWwiOiJuZ3V5ZW5kb2FudGhlMDYxMEBnbWFpbC5jb20iLCJpYXQiOjE2OTE2OTY4NzMsImV4cCI6MTY5MTcwNDA3M30.kppS8HzGyWBpJoi3Q-ExdHwD0uyX6wivNc12puODC9U";
  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditProfileScreen(userProfile: userProfile),
                ),
              );
            },
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
                                  image: NetworkImage('assets/images/logo.jpg'),
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
                              "${userProfile["name"]}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Chỉnh sửa',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor),
                                  ),
                                  Icon(
                                    Icons.navigate_next_rounded,
                                    size: 16,
                                    color:
                                        Theme.of(context).unselectedWidgetColor,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyGiftScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 70,
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
                    Icon(
                      Icons.collections_bookmark_outlined,
                      size: 24,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Quà Của tôi',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     print('Saved');
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          //     child: Container(
          //       padding: EdgeInsets.all(16),
          //       height: 70,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.all(Radius.circular(15)),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.2),
          //               blurRadius: 7,
          //             )
          //           ]),
          //       child: Row(
          //         children: [
          //           Icon(
          //             Icons.gif_box_outlined,
          //             size: 24,
          //           ),
          //           Container(
          //             width: 8,
          //           ),
          //           Expanded(
          //             child: Text(
          //               'Đã lưu',
          //               style: TextStyle(fontSize: 16),
          //             ),
          //           ),
          //           Icon(Icons.navigate_next_rounded)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddressScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 70,
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
                    Icon(
                      Icons.map_outlined,
                      size: 24,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Địa chỉ của tôi',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePassWordScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 70,
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
                    Icon(
                      Icons.lock_open_outlined,
                      size: 24,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Đổi mật khẩu',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Language');
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 70,
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
                    Icon(
                      Icons.language_rounded,
                      size: 24,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Chính sách thành viên',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.navigate_next_rounded)
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Log out');
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                padding: EdgeInsets.all(16),
                height: 70,
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
                    Icon(
                      Icons.login_rounded,
                      size: 24,
                      color: Colors.red,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
