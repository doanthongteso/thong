//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalty/screen/scan/scan_info.dart';
//import 'package:flutter/services.dart';

import '../../api/api_clients.dart';
import '../../component/validator.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  void _showFailPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: Text('Vui lòng kiểm tra lại mã CODE'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> scanCode() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));
      String accessToken = (await storage.read(key: 'accessToken')).toString();
      dynamic res = await _apiClient.addPoint(accessToken, codeController.text);

      print(res);
      // print(res.statusCode);

      //print(res);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res['message'] == 'Used') {
        _showFailPopup('Mã CODE đã được sử dụng');
      } else if (res['message'] == 'Not found') {
        _showFailPopup('Mã CODE không tồn tại');
      } else if (res["message"] == "Success") {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScanInfoScreen();
          },
        ));
      }
    }
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
                    //borderRadius: BorderRadius.circular(20),
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
                            'Cào nhẹ lớp phủ để lấy mã CODE trên thẻ cào.',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/macode.jpg',
                            width: 300,
                            height: 300,
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: codeController,
                          validator: (value) {
                            return Validator.validateNumber(value ?? "");
                          },
                          decoration: InputDecoration(
                            hintText: "NHẬP MÃ CODE TRÊN THẺ CÀO",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        //SizedBox(height: size.height * 0.04),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  scanCode();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
                                child: const Text(
                                  "Tiếp tục",
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
