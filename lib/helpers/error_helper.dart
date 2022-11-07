// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:fake_shop/models/common/error_model.dart';

class ErrorHelper {
  static ErrorModel handleDioError(dynamic error) {
    var _errorModel = ErrorModel(
      hasError: true,
      errorType: 'Error',
      errorMessage: 'Oops! Something went wrong. Please try again.',
    );

    try {
      if (error.type != null && error.type == DioErrorType.connectTimeout) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Connection timeout! Please check internet connection.',
        );
      } else if (error.type != null && error.type == DioErrorType.sendTimeout) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Send timeout! Please check internet connection.',
        );
      } else if (error.type != null &&
          error.type == DioErrorType.receiveTimeout) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Receive timeout! Please check internet connection.',
        );
      } else if (error.type != null && error.type == DioErrorType.cancel) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Request cancelled! Please check internet connection.',
        );
      } else if (error.type != null && error.type == DioErrorType.response) {
        if (error.response?.statusCode != null &&
            error.response?.statusCode == 0) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage:
                'Server not responding! Please contact system administrator.',
          );
        } else if (error.response?.statusCode != null &&
            error.response?.statusCode == 111) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage:
                'Connection Refused! Please check internet connection.',
          );
        } else if (error.response?.statusCode != null &&
            error.response?.statusCode == 404) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage:
                'Invalid request URL! Please contact system administrator.',
          );
        } else if (error.response?.statusCode != null &&
            error.response?.statusCode == 401) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage: 'HTTP Error 401 - Unauthorized.',
          );
        } else if (error.response?.statusCode != null &&
            error.response?.statusCode == 400) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage: 'HTTP Error 400 - Bad request.',
          );
        } else if (error.response?.statusCode != null &&
            error.response?.statusCode == 500) {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage:
                'Sever not responding! Please contact system administrator.',
          );
        } else {
          _errorModel = ErrorModel(
            hasError: true,
            errorType: 'Error',
            errorMessage: 'Oops! Something went wrong. Please try again.',
          );
        }
      } else if (error.type != null && error.type == DioErrorType.other) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Oops! Something went wrong. Please try again.',
        );
      } else if (error.message != null && error.message.toString().isNotEmpty) {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: error.message.toString(),
        );
      } else {
        _errorModel = ErrorModel(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Oops! Something went wrong. Please try again.',
        );
      }

      return _errorModel;
    } catch (exception) {
      return ErrorModel(
        hasError: true,
        errorType: 'Error',
        errorMessage: 'Oops! Something went wrong. Please try again.',
      );
    }
  }

  static ErrorModel handleServerErrorMessage(dynamic response) {
    final _errorModel = ErrorModel(
      hasError: true,
      errorType: 'Error',
      errorMessage: 'Oops! Something went wrong. Please try again.',
    );

    // if (response.data['HasError']) {
    //   if (response.data['Messages'] != null) {
    //     var message = response.data['Messages'][0];

    //     if (message.toString().isNotEmpty) {
    //       _errorModel = ErrorModel(true, 'Error', message.toString());
    //     }

    //     if (message.toString().isEmpty) {}
    //     _errorModel =
    //         ErrorModel(true, 'Error', 'Oops! Error received from server.');
    //   }
    // }
    return _errorModel;
  }
}
