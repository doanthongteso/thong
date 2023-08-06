import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);
  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return MyInfo();
            //   }));
            // },
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
                                  image: NetworkImage(
                                      'https://images.viblo.asia/fe08fd0e-bf25-4a5a-b7e5-9dca33cfc692.png'),
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
                              'Tên Người Dùng',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Edit profile',
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
              print('Mine');
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
          GestureDetector(
            onTap: () {
              print('Saved');
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
                      Icons.gif_box_outlined,
                      size: 24,
                    ),
                    Container(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Đã lưu',
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
              print('Professor');
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
              print('Password');
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
                        'Tiếng Việt',
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
