import 'package:dio/dio.dart';
import 'package:fake_shop/core/settings/api_settings.dart';
import 'package:fake_shop/helpers/error_helper.dart';
import 'package:fake_shop/models/response/dio_response.dart';

class BaseClient {
  Dio dio = Dio();

  Future<DioResponse> dioGet({
    required String actionUrl,
  }) async {
    dio.options.responseType = ResponseType.json;
    final url = ApiSettings.baseUrl + actionUrl;
    var dioResponse = DioResponse(
      responseStr: '',
      hasError: true,
      errorMessage: 'Cannot fetch data.',
    );

    try {
      final Response<dynamic> response = await dio
          .get<String>(
            url,
            options: Options(
              responseType: ResponseType.json,
              headers: ApiSettings.baseHeaders,
            ),
          )
          .timeout(const Duration(seconds: 60))
          .onError((error, stackTrace) {
        throw Exception(error);
      });

      if (response.statusCode == 200) {
        //TO DO: implement server error check here
        dioResponse = DioResponse(
          responseStr: response.toString(),
          hasError: false,
          errorMessage: '',
        );
      }
    } catch (error) {
      dioResponse = DioResponse(
        responseStr: '',
        hasError: true,
        //TO DO: test handle dio error for all the cases
        errorMessage: ErrorHelper.handleDioError(error) as String,
      );
    }

    return dioResponse;
  }

  Future<DioResponse> dioGetParameterized({
    required String actionUrl,
    required Map<String, dynamic> queryParams,
  }) async {
    dio.options.responseType = ResponseType.json;
    final url = ApiSettings.baseUrl + actionUrl;
    var dioResponse = DioResponse(
      responseStr: '',
      hasError: true,
      errorMessage: 'Cannot fetch data.',
    );

    try {
      final Response<dynamic> response = await dio
          .get<String>(
            url,
            options: Options(
              responseType: ResponseType.json,
              headers: ApiSettings.baseHeaders,
            ),
            queryParameters: queryParams,
          )
          .timeout(const Duration(seconds: 60))
          .onError((error, stackTrace) {
        throw Exception(error);
      });

      if (response.statusCode == 200) {
        //TO DO: implement server error check here
        dioResponse = DioResponse(
          responseStr: response.toString(),
          hasError: false,
          errorMessage: '',
        );
      }
    } catch (error) {
      dioResponse = DioResponse(
        responseStr: '',
        hasError: true,
        //TO DO: test handle dio error for all the cases
        errorMessage: ErrorHelper.handleDioError(error) as String,
      );
    }

    return dioResponse;
  }

  Future<DioResponse> dioPost({
    required String actionUrl,
    required Map<String, dynamic> queryParams,
  }) async {
    dio.options.responseType = ResponseType.json;
    final url = ApiSettings.baseUrl + actionUrl;
    var dioResponse = DioResponse(
      responseStr: '',
      hasError: true,
      errorMessage: 'Cannot fetch data.',
    );

    try {
      final Response<dynamic> response = await dio
          .post<String>(
            url,
            options: Options(
              responseType: ResponseType.json,
              headers: ApiSettings.baseHeaders,
            ),
            queryParameters: queryParams,
          )
          .timeout(const Duration(seconds: 60))
          .onError((error, stackTrace) {
        throw Exception(error);
      });

      if (response.statusCode == 200) {
        //TO DO: implement server error check here
        dioResponse = DioResponse(
          responseStr: response.toString(),
          hasError: false,
          errorMessage: '',
        );
      }
    } catch (error) {
      dioResponse = DioResponse(
        responseStr: '',
        hasError: true,
        //TO DO: test handle dio error for all the cases
        errorMessage: ErrorHelper.handleDioError(error) as String,
      );
    }

    return dioResponse;
  }

  Future<DioResponse> dioDelete({
    required String actionUrl,
    required int id,
  }) async {
    dio.options.responseType = ResponseType.json;
    final url = '${ApiSettings.baseUrl}$actionUrl/$id';
    var dioResponse = DioResponse(
      responseStr: '',
      hasError: true,
      errorMessage: 'Cannot fetch data.',
    );

    try {
      final Response<dynamic> response = await dio
          .delete<String>(
            url,
            options: Options(
              responseType: ResponseType.json,
              headers: ApiSettings.baseHeaders,
            ),
          )
          .timeout(const Duration(seconds: 60))
          .onError((error, stackTrace) {
        throw Exception(error);
      });

      if (response.statusCode == 200) {
        //TO DO: implement server error check here
        dioResponse = DioResponse(
          responseStr: response.toString(),
          hasError: false,
          errorMessage: '',
        );
      }
    } catch (error) {
      dioResponse = DioResponse(
        responseStr: '',
        hasError: true,
        //TO DO: test handle dio error for all the cases
        errorMessage: ErrorHelper.handleDioError(error) as String,
      );
    }

    return dioResponse;
  }
}
