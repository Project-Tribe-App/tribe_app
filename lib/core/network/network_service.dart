// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BaseApiService {
  final Logger logger = Logger();
  static const int maxRetryAttempts = 3; // Set a maximum number of retries
  // So that we don't get stuck in an infinite recursions.

  // Future<dynamic> getRequestMethod(String url, {int retryCount = 0}) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: await headers,
  //     );

  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401 || response.statusCode == 403) {
  //       if (retryCount < maxRetryAttempts) {
  //         final bool tokenRefreshed = await _handleTokenRefresh();
  //         if (tokenRefreshed) {
  //           debugPrint('Retrying the request $retryCount times');
  //           return await getRequestMethod(url, retryCount: retryCount + 1); // Retry the request
  //         } else {
  //           await _logoutUser();
  //           Utility.showErrorToast(
  //             context: Get.overlayContext!,
  //             title: tr('somethingWentWrong'),
  //             description: tr('tryloginAgain'),
  //           );
  //           throw Exception('Failed to refresh token, logging out the user');
  //         }
  //       } else {
  //         await _logoutUser();
  //         Utility.showErrorToast(
  //           context: Get.overlayContext!,
  //           title: tr('somethingWentWrong'),
  //           description: tr('tryloginAgain'),
  //         );
  //         throw Exception('Exceeded maximum retry attempts, logging out the user');
  //       }
  //     } else {
  //       throw Exception(
  //         'Network Error: ${response.body}, response code: ${response.statusCode}',
  //       );
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<dynamic> postRequestMethod(String url, dynamic data, {int retryCount = 0}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: await headers,
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401 || response.statusCode == 403) {
  //       if (retryCount < maxRetryAttempts) {
  //         final bool tokenRefreshed = await _handleTokenRefresh();
  //         if (tokenRefreshed) {
  //           debugPrint('Retrying the request $retryCount times');
  //           return await postRequestMethod(url, data, retryCount: retryCount + 1); // Retry the request
  //         } else {
  //           await _logoutUser();
  //           Utility.showErrorToast(
  //             context: Get.overlayContext!,
  //             title: tr('somethingWentWrong'),
  //             description: tr('tryloginAgain'),
  //           );
  //           throw Exception('Failed to refresh token, logging out the user');
  //         }
  //       } else {
  //         await _logoutUser();
  //         Utility.showErrorToast(
  //           context: Get.overlayContext!,
  //           title: tr('somethingWentWrong'),
  //           description: tr('tryloginAgain'),
  //         );
  //         throw Exception('Exceeded maximum retry attempts, logging out the user');
  //       }
  //     } else {
  //       throw Exception('Network Error: ${response.body}');
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<dynamic> putRequestMethod(String url, dynamic data, {int retryCount = 0}) async {
  //   try {
  //     final response = await http.put(
  //       Uri.parse(url),
  //       headers: await headers,
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401) {
  //       if (retryCount < maxRetryAttempts) {
  //         final bool tokenRefreshed = await _handleTokenRefresh();
  //         if (tokenRefreshed) {
  //           debugPrint('Retrying the request $retryCount times');
  //           return await putRequestMethod(url, data, retryCount: retryCount + 1); // Retry the request
  //         } else {
  //           await _logoutUser();
  //           Utility.showErrorToast(
  //             context: Get.overlayContext!,
  //             title: tr('somethingWentWrong'),
  //             description: tr('tryloginAgain'),
  //           );
  //           throw Exception('Failed to refresh token, logging out the user');
  //         }
  //       } else {
  //         await _logoutUser();
  //         Utility.showErrorToast(
  //           context: Get.overlayContext!,
  //           title: tr('somethingWentWrong'),
  //           description: tr('tryloginAgain'),
  //         );
  //         throw Exception('Exceeded maximum retry attempts, logging out the user');
  //       }
  //     } else {
  //       throw Exception('Network Error: ${response.body}');
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<dynamic> patchRequestMethod(String url, dynamic data, {int retryCount = 0}) async {
  //   try {
  //     final response = await http.patch(
  //       Uri.parse(url),
  //       headers: await headers,
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return json.decode(response.body);
  //     } else if (response.statusCode == 401 || response.statusCode == 403) {
  //       if (retryCount < maxRetryAttempts) {
  //         final bool tokenRefreshed = await _handleTokenRefresh();
  //         if (tokenRefreshed) {
  //           debugPrint('Retrying the request $retryCount times');
  //           return await patchRequestMethod(url, data, retryCount: retryCount + 1); // Retry the request
  //         } else {
  //           await _logoutUser();
  //           Utility.showErrorToast(
  //             context: Get.overlayContext!,
  //             title: tr('somethingWentWrong'),
  //             description: tr('tryloginAgain'),
  //           );
  //           throw Exception('Failed to refresh token, logging out the user');
  //         }
  //       } else {
  //         await _logoutUser();
  //         Utility.showErrorToast(
  //           context: Get.overlayContext!,
  //           title: tr('somethingWentWrong'),
  //           description: tr('tryloginAgain'),
  //         );
  //         throw Exception('Exceeded maximum retry attempts, logging out the user');
  //       }
  //     } else {
  //       throw Exception('Network Error: ${response.body}');
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<bool> logOutMethod({int retryCount = 0}) async {
  //   final String url = '${ApiEndpoints.baseUrl}${ApiEndpoints.users}${ApiEndpoints.logout}';
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: await headers,
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return true;
  //     } else if (response.statusCode == 401 || response.statusCode == 403) {
  //       if (retryCount < maxRetryAttempts) {
  //         final bool tokenRefreshed = await _handleTokenRefresh();
  //         if (tokenRefreshed) {
  //           debugPrint('Retrying the request $retryCount times');
  //           return await logOutMethod(); // Retry the logout request
  //         } else {
  //           await _logoutUser();
  //           throw Exception('Failed to refresh token, logging out the user');
  //         }
  //       } else {
  //         await _logoutUser();
  //         throw Exception('Exceeded maximum retry attempts, logging out the user');
  //       }
  //     } else {
  //       throw Exception('Failed to post data');
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<int> verifyOtp(String otp) async {
  //   final String url = '${ApiEndpoints.baseUrl}${ApiEndpoints.verifyOtp}';

  //   final Uri uri = Uri.parse(url).replace(queryParameters: {'verification': otp});
  //   try {
  //     final response = await http.get(
  //       uri,
  //     );
  //     if (response.statusCode == 200) {
  //       return 200;
  //     } else {
  //       if (response.statusCode == 400) {
  //         return 400;
  //       }
  //       return 500;
  //     }
  //   } catch (e) {
  //     logger.e('Error while verifying OTP: $e');
  //     return 500;
  //   }
  // }

  // Future<bool> _handleTokenRefresh() async {
  //   final refreshToken = await StorageService.getValue('refreshToken');
  //   final Map<String, dynamic> data = {'refreshToken': refreshToken};
  //   return refreshTokenMethod(data);
  // }

  // Future<bool> refreshTokenMethod(Map<String, dynamic> data) async {
  //   final String url = '${ApiEndpoints.baseUrl}${ApiEndpoints.refreshToken}';
  //   try {
  //     final res = await http.post(
  //       // not using previous POST method as It may laed to infinite recursive calls.
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(data),
  //     );
  //     final jsonData = json.decode(res.body);
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       await StorageService.deleteAll();
  //       final responseBody = jsonData['data'] as Map<String, dynamic>;
  //       debugPrint('adding data into secure storage after refresh token API hit');
  //       debugPrint(ApiEndpoints.user);
  //       debugPrint(ApiEndpoints.envi);
  //       await StorageService.saveAll({
  //         'authToken': responseBody['authToken'],
  //         'refreshToken': responseBody['refreshToken'],
  //         'expiresIn': DateTime.now().add(Duration(minutes: responseBody['expiresIn'] ?? 0)).toString(),
  //         'userType': ApiEndpoints.user,
  //         'selectedEnv': ApiEndpoints.envi,
  //       });
  //       debugPrint(StorageService.getValue('refreshToken').toString());
  //       debugPrint(StorageService.getValue('userType').toString());
  //       debugPrint(StorageService.getValue('selectedEnv').toString());
  //       return true;
  //     } else {
  //       logger.e('Error refreshing token: $jsonData status code: ${res.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint('Error fetching data: $e');
  //     return false;
  //   }
  // }

  // Future<String> uploadAssetMethod(Map<String, dynamic> data, File file) async {
  //   final String url = '${ApiEndpoints.baseUrl}${ApiEndpoints.preSigned}';
  //   try {
  //     // Make the POST request to get the presigned URL
  //     final response = await postRequestMethod(url, data);
  //     if (response != false) {
  //       final Map<String, dynamic> responseData = response as Map<String, dynamic>;
  //       final String presignedUrl = responseData['data']['presignedUrl'] as String;
  //       final String objectUrl = responseData['data']['objectUrl'] as String;
  //       final String fileName = responseData['data']['filename'] as String;

  //       debugPrint(responseData['data']['objectUrl']);

  //       // Upload the file to S3 using the presigned URL
  //       final res = await putFileToServer(preSignedUrl: presignedUrl, file: file);
  //       if (res) {
  //         debugPrint('File uploaded successfully1');
  //         return objectUrl;
  //       }
  //       throw Exception('Failed to upload file with filename: $fileName \n $res');
  //     }
  //     throw Exception('Failed to get presigned URL');
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return e.toString();
  //   }
  // }

  // Future<bool> putFileToServer({
  //   required String preSignedUrl,
  //   required File file,
  // }) async {
  //   try {
  //     final fileBytes = await file.readAsBytes();

  //     final res = await http.put(
  //       Uri.parse(preSignedUrl),
  //       body: fileBytes,
  //     );

  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       debugPrint('File uploaded successfully2');
  //       return true;
  //     }
  //     throw Exception('Failed to upload file to presigned URL /n ${res.body}');
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     return false;
  //   }
  // }

  // Future<void> deleteRequestMethod(String url) async {
  //   try {
  //     final response = await http.delete(
  //       Uri.parse(url),
  //       headers: await headers,
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception('Failed to delete data');
  //     }
  //   } catch (e) {
  //     logger.e('Error: $e');
  //     throw Exception('Network Error: $e');
  //   }
  // }

  // Future<Map<String, String>> get headers async {
  //   //final String token = await StorageService.getValue('authToken');
  //   return {
  //     'Content-Type': 'application/json',
  //     //'Authorization': 'Bearer $token',
  //   };
  // }

  Future<http.Response> postOnboardMethod(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      return response;
    } catch (e) {
      logger.e('Error: $e');
      throw Exception('Network Error: $e');
    }
  }

  // Future<void> _logoutUser() async {
  //   await HiveStorage().deleteAllBoxes();
  //   await StorageService.deleteAll();
  //   await Get.offAll(LoginScreen.new);
  // }
}
