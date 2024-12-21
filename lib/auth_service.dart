import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://0.0.0.0:3000';

  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      // Check if the response is JSON
      String contentType = response.headers['content-type'] ?? '';
      if (!contentType.contains('application/json')) {
        throw AuthException(
          'Server error: Expected JSON response but received different format. Please try again later.',
        );
      }

      // Try to parse the response body
      Map<String, dynamic> bodyMap;
      try {
        bodyMap = json.decode(response.body);
      } catch (e) {
        throw AuthException(
          'Failed to parse server response. Please try again later.',
        );
      }

      // Handle different status codes
      switch (response.statusCode) {
        case 200:
          return LoginResponse.fromJson(bodyMap);
        case 401:
          throw AuthException(bodyMap['error'] ?? 'Invalid credentials');
        case 404:
          throw AuthException('Server endpoint not found');
        case 500:
          throw AuthException('Internal server error');
        default:
          throw AuthException(
            bodyMap['error'] ?? 'An unexpected error occurred',
          );
      }
    } on http.ClientException catch (e) {
      throw AuthException('Connection error: Please check your internet connection');
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<RegistrationResponse> register({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String company,
    required String designation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
          'phone': phone,
          'company': company,
          'designation': designation,
        }),
      );

      // Check if the response is JSON
      String contentType = response.headers['content-type'] ?? '';
      if (!contentType.contains('application/json')) {
        throw AuthException(
          'Server error: Expected JSON response but received different format',
        );
      }

      // Try to parse the response body
      Map<String, dynamic> bodyMap;
      try {
        bodyMap = json.decode(response.body);
      } catch (e) {
        throw AuthException('Failed to parse server response');
      }

      switch (response.statusCode) {
        case 201:
          return RegistrationResponse.fromJson(bodyMap);
        case 400:
          throw AuthException(bodyMap['error'] ?? 'Invalid registration data');
        case 409:
          throw AuthException(bodyMap['error'] ?? 'User already exists');
        case 500:
          throw AuthException('Internal server error');
        default:
          throw AuthException(
            bodyMap['error'] ?? 'An unexpected error occurred',
          );
      }
    } on http.ClientException catch (e) {
      throw AuthException('Connection error: Please check your internet connection');
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException('An unexpected error occurred: ${e.toString()}');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class LoginResponse {
  final String message;
  final UserModel user;
  final String? token;

  LoginResponse({
    required this.message,
    required this.user,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    try {
      return LoginResponse(
        message: json['message'] ?? '',
        user: UserModel.fromJson(json['user'] ?? {}),
        token: json['token'],
      );
    } catch (e) {
      throw AuthException('Invalid response format from server');
    }
  }
}

class RegistrationResponse {
  final String message;
  final UserModel user;

  RegistrationResponse({
    required this.message,
    required this.user,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    try {
      return RegistrationResponse(
        message: json['message'] ?? '',
        user: UserModel.fromJson(json['user'] ?? {}),
      );
    } catch (e) {
      throw AuthException('Invalid response format from server');
    }
  }
}

class UserModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String company;
  final String designation;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.company,
    required this.designation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? -1,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      company: json['company'] ?? '',
      designation: json['designation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'company': company,
      'designation': designation,
    };
  }
}