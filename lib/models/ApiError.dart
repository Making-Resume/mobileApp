class ApiError {
  final int? statusCode;
  final String? message;


  ApiError({this.statusCode, this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,

    };
  }
}