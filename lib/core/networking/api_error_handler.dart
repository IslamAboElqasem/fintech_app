import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'api_error_model.dart';
import 'firebase_error_handler.dart';

/// Centralized error handler for all types of errors (Dio, Firebase, etc.)
class ApiErrorHandler {
  /// Main error handling method - handles all error types
  static ApiErrorModel handle(dynamic error) {
    // Handle Firebase Authentication errors
    if (error is FirebaseAuthException) {
      return FirebaseErrorHandler.handle(error);
    }

    // Handle Dio HTTP errors
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return const ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return const ApiErrorModel(
            message: "Request to the server was cancelled",
          );
        case DioExceptionType.connectionTimeout:
          return const ApiErrorModel(
            message: "Connection timeout with the server",
          );
        case DioExceptionType.unknown:
          return const ApiErrorModel(
            message:
                "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return const ApiErrorModel(
            message: "Receive timeout in connection with the server",
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return const ApiErrorModel(
            message: "Send timeout in connection with the server",
          );
        default:
          return const ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return const ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  // Debug logging to see actual API error format
  debugPrint('🔴 API Error Response: $data');

  if (data == null) {
    return const ApiErrorModel(message: "Unknown error occurred");
  }

  // Try multiple common error formats from CoinGecko API
  String? errorMessage;

  if (data is Map<String, dynamic>) {
    // Format 1: {"error": "message"}
    errorMessage = data['error'] as String?;

    // Format 2: {"message": "message"}
    errorMessage ??= data['message'] as String?;

    // Format 3: {"status": {"error_message": "message"}}
    // CoinGecko often uses this format for rate limiting and other errors
    if (errorMessage == null && data['status'] is Map) {
      final status = data['status'] as Map<String, dynamic>;
      errorMessage = status['error_message'] as String?;
      errorMessage ??= status['message'] as String?;
    }

    // Format 4: {"error_message": "message"}
    errorMessage ??= data['error_message'] as String?;
  }

  return ApiErrorModel(
    message: errorMessage ?? "Unknown error occurred",
  );
}
