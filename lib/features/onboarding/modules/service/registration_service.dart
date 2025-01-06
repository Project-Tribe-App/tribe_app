// Project imports:
import 'package:project_tribe/core/network/endpoints.dart';
import 'package:project_tribe/core/network/network_service.dart';

class RegistrationService extends BaseApiService {
  Future<dynamic> registerUser(Map<String, dynamic> data) async {
    const url = '${ApiEndpoints.baseUrl}${ApiEndpoints.register}';
    final response = await postOnboardMethod(url, data);
    return response;
  }
}
