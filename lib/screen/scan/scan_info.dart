import 'package:flutter/material.dart';
import 'package:loyalty/screen/BottomNavigationLayout.dart';
import 'package:loyalty/screen/auth/register.dart';
import 'package:loyalty/screen/home/home_test.dart';
import 'package:loyalty/screen/scan/scan.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../api/api_clients.dart';
import '../../component/validator.dart';
import '../home/home.dart';

class ScanInfoScreen extends StatefulWidget {
  const ScanInfoScreen({Key? key}) : super(key: key);
  @override
  State<ScanInfoScreen> createState() => _ScanInfoScreenState();
}

class _ScanInfoScreenState extends State<ScanInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  // final ApiClient _test = testLoginAPI();
  bool _showPassword = false;

  Future<void> forgotpassword() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.login(
        emailController.text,
        passwordController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['message'] == 'Logged in') {
        String accessToken = res['accessToken'];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(accesstoken: accessToken)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/logo.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 16),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 2, 2),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Chúc mừng bạn đã nhận được 10 xu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BottomNavigationLayout();
                    },
                  ));
                },
                child: Text('Quay về trang chủ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
