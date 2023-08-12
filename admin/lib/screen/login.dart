import 'dart:ui';
import 'package:admin/BottomLayout.dart';
import 'package:admin/screen/GiftScreen.dart';
import 'package:admin/screen/NotificationScreen.dart';
import 'package:admin/screen/UserScreen.dart';
import 'package:flutter/material.dart';
// import 'package:loyalty/api/api_clients.dart';
// import 'package:loyalty/screen/BottomNavigationLayout.dart';
// import 'package:loyalty/screen/auth/forgotpassword.dart';
// import 'package:loyalty/screen/home/home.dart';
import 'package:admin/component/validator.dart';
// import 'dart:io';
// import 'dart:html';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //final ApiClient _apiClient = ApiClient();
  //final storage = const FlutterSecureStorage();
  // final ApiClient _test = testLoginAPI();
  bool _showPassword = false;

  Future<void> login() async {
    //   if (_formKey.currentState!.validate()) {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: const Text('Processing Data'),
    //       backgroundColor: Colors.green.shade300,
    //     ));

    //     dynamic res = await _apiClient.login(
    //       emailController.text,
    //       passwordController.text,
    //     );
    //     print(res);
    //     print(res.statusCode);

    //     // Write value
    //     FlutterSecureStorage.setMockInitialValues({});
    //     await storage.write(key: 'accessToken', value: res.data['token']);

    //     //print(res);

    //     ScaffoldMessenger.of(context).hideCurrentSnackBar();

    //     if (res.statusCode == 200) {
    //       String accessToken = res.data['token'];
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => BottomNavigationLayout()));
    //     } else {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         content: Text('Error: ${res.data['message']}'),
    //         backgroundColor: Colors.red.shade300,
    //       ));
    //     }
    //   }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: Form(
          key: _formKey,
          child: Stack(children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 1,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: size.height * 0.08),

                        const Center(
                          child: Text(
                            "Admin Loyalty",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.06),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            return Validator.validateEmail(value ?? "");
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          obscureText: _showPassword,
                          controller: passwordController,
                          validator: (value) {
                            return Validator.validatePassword(value ?? "");
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Mật khẩu",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.04),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return BottomNavigationLayout();
                                    },
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
                                child: const Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  //),
                ),
              ),
            ),
          ]),
        ));
  }
}
