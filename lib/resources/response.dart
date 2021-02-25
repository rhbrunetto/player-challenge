import 'package:meta/meta.dart';

class RepositoryResponse<T> {
  final String message;
  final bool isSucessfull;
  final bool isOnline;
  final T data;
  final int statusCode;

  bool get isUnauthorized => statusCode == 401;

  ErrorModel get error => ErrorModel(
        message: message,
        isUnauthorized: isUnauthorized,
      );

  RepositoryResponse.sucessOnline({
    this.isOnline = true,
    @required this.data,
    this.message,
    this.statusCode,
  }) : isSucessfull = true;

  RepositoryResponse.sucessOffline({
    this.isOnline = false,
    @required this.data,
    this.message,
    this.statusCode,
  }) : isSucessfull = true;

  RepositoryResponse.failure({
    this.isOnline,
    this.data,
    this.statusCode,
    @required this.message,
  }) : isSucessfull = false;
}

class ErrorModel {
  final String message;
  final bool isUnauthorized;

  ErrorModel({
    this.message,
    this.isUnauthorized,
  });
}
