import 'package:dio/dio.dart';
import 'package:fake_shop/core/api_setting.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<String> getProducts() async {
    Response response;
    response = await _dio.get<String>('${ApiSetting.baseUrl}products');
    return response.data.toString();
  }
}
