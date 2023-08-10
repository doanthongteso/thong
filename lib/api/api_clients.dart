import 'package:dio/dio.dart';
import 'package:loyalty/component/constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post('http://127.0.0.1:3000/register',
          data: data,
          options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/login',
        data: {
          'email': email,
          'password': password,
        },
        //queryParameters: {'apikey': ApiSecret.apiKey},
      );
      print(response.statusCode);
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> verifyOTP(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/verify',
        data: data,
        //options: Options(headers: {'X-LoginRadius-Sott': ApiSecret.sott})
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  // Future<dynamic> login(String email, String password) async {
  //   try {
  //     Response response = await _dio.post(
  //       'localhost:5000/taikhoan/dangnhap',
  //       data: {
  //         "email": email,
  //         "password": password,
  //       },
  //       queryParameters: {'apikey': ApiSecret.apiKey},
  //     );
  //     return response.data;
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:3000/api/user/email',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      print(response);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.loginradius.com/identity/v2/auth/account',
        data: data,
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
  // Gift

  Future<dynamic> getGiftByCategory(String accessToken, String category) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:3000/api/gift/$category',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      // print(response);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getAllGift(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:3000/api/gift',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      // print(response);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getBanner() async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:3000/api/banner/getBanner',
        // options: Options(
        //   headers: {'Authorization': 'Bearer $accessToken'},
        // ),
      );
      // print(response);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> addPoint(String accessToken, String code) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/api/productCode/addPoint',
        data: {
          'productCode': code,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      // print(response);
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
