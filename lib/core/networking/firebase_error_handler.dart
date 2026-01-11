import 'package:firebase_auth/firebase_auth.dart';

import 'api_error_model.dart';

/// Handles Firebase Authentication errors and converts them to ApiErrorModel
class FirebaseErrorHandler {
  /// Maps Firebase error codes to user-friendly error messages
  static ApiErrorModel handle(FirebaseAuthException exception) {
    String message;
    int statusCode;

    switch (exception.code) {
      // Email & Password related errors
      case 'email-already-in-use':
        message =
            'This email address is already registered. Please use a different email or try logging in.';
        statusCode = 400;
        break;
      case 'invalid-email':
        message =
            'The email address is not valid. Please enter a valid email address.';
        statusCode = 400;
        break;
      case 'weak-password':
        message =
            'The password is too weak. Please use a stronger password with at least 6 characters.';
        statusCode = 400;
        break;
      case 'wrong-password':
        message =
            'The password is incorrect. Please try again or reset your password.';
        statusCode = 401;
        break;

      // User related errors
      case 'user-not-found':
        message =
            'No account found with this email address. Please check your email or sign up.';
        statusCode = 404;
        break;
      case 'user-disabled':
        message =
            'This account has been disabled. Please contact support for assistance.';
        statusCode = 403;
        break;

      // Network & Server errors
      case 'network-request-failed':
        message =
            'Network error. Please check your internet connection and try again.';
        statusCode = 503;
        break;
      case 'too-many-requests':
        message =
            'Too many unsuccessful attempts. Please try again later or reset your password.';
        statusCode = 429;
        break;

      // Operation errors
      case 'operation-not-allowed':
        message = 'This operation is not allowed. Please contact support.';
        statusCode = 403;
        break;
      case 'invalid-credential':
        message = 'The credentials provided are invalid. Please try again.';
        statusCode = 401;
        break;

      // Action code errors
      case 'expired-action-code':
        message = 'This link has expired. Please request a new one.';
        statusCode = 400;
        break;
      case 'invalid-action-code':
        message = 'This link is invalid or has already been used.';
        statusCode = 400;
        break;

      // Additional common errors
      case 'requires-recent-login':
        message =
            'This operation requires recent authentication. Please log in again.';
        statusCode = 401;
        break;
      case 'credential-already-in-use':
        message =
            'This credential is already associated with a different account.';
        statusCode = 400;
        break;
      case 'invalid-verification-code':
        message = 'The verification code is invalid. Please try again.';
        statusCode = 400;
        break;
      case 'invalid-verification-id':
        message =
            'The verification ID is invalid. Please request a new verification code.';
        statusCode = 400;
        break;
      case 'app-not-authorized':
        message = 'This app is not authorized to use Firebase Authentication.';
        statusCode = 403;
        break;
      case 'invalid-api-key':
        message = 'Invalid API key. Please contact support.';
        statusCode = 403;
        break;
      case 'account-exists-with-different-credential':
        message =
            'An account already exists with the same email but different sign-in credentials.';
        statusCode = 400;
        break;

      // Default case for unknown errors
      default:
        message =
            exception.message ??
            'An unexpected error occurred. Please try again.';
        statusCode = 500;
    }

    return ApiErrorModel(
      message: message,
      statusCode: statusCode,
    );
  }
}
