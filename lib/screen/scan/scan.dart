//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
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
  String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMCwiZW1haWwiOiJuZ3V5ZW5kb2FudGhlMDYxMEBnbWFpbC5jb20iLCJpYXQiOjE2OTE2MDExMTgsImV4cCI6MTY5MTYwODMxOH0.keqR0UN5L-yPTRnBr4RtP63oJ0XW7YXC5NeJOhdVgT8";
  Future<void> scanCode() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.addPoint(accessToken, codeController.text);

      print(res);
      print(res.statusCode);

      //print(res);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res.statusCode == 200) {
        //String accessToken = res.data['token'];
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScanInfoScreen();
          },
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res.data['message']}'),
          backgroundColor: Colors.red.shade300,
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

                        SizedBox(height: size.height * 0.06),
                        TextFormField(
                          controller: codeController,
                          validator: (value) {
                            return Validator.validateNumber(value ?? "");
                          },
                          decoration: InputDecoration(
                            hintText: "NHẬP MÃ CODE TRÊN TEM SẢN PHẨM",
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
