import 'dart:convert';

class MResponseEntity<T> {
  static const successCode = 100;
  static const errorCode = 501;

  static MResponseEntity<T> createSuccessData<T>(T data) {
    return MResponseEntity<T>(code: successCode, success: true, data: data);
  }

  static MResponseEntity<T> createErrorData<T>(String? message) {
    return MResponseEntity<T>(
        code: errorCode, success: false, message: message);
  }

  bool? success;

  MResponseEntity({this.success, this.code, this.data, this.message});

  int? code;
  String? message;
  T? data;

  @override
  String toString() {
    return jsonEncode(this);
  }
}
