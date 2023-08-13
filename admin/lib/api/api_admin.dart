import 'package:dio/dio.dart';
import 'package:admin/component/constants.dart';

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
        'http://127.0.0.1:3000/admin-login',
        data: {
          'email': email,
          'password': password,
        },
        //queryParameters: {'apikey': ApiSecret.apiKey},
      );
      return response.data;
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

  Future<dynamic> getAllUserData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://127.0.0.1:3000/api/user',
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
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserHistoryPoint(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://localhost:3000/api/historyPoint/userHistory',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      print(response.statusCode);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getNotification(String accessToken) async {
    try {
      Response response = await _dio.get(
        'http://localhost:3000/api/notification',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      print(response.statusCode);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> banUser(String accessToken, int userId) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/api/user/banUser/${userId}',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> activeUser(String accessToken, int userId) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/api/user/activeUser/${userId}',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> editNotification(
      String accessToken, int notiId, dynamic data) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/api/notification/update/${notiId}',
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> createNotification(String accessToken, dynamic data) async {
    try {
      Response response = await _dio.post(
        'http://127.0.0.1:3000/api/notification/create/',
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> deleteNotification(
      String accessToken, int notiId) async {
    try {
      Response response = await _dio.delete(
        'http://127.0.0.1:3000/api/notification/delete/${notiId}',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
