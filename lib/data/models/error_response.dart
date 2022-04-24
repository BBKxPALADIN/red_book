class ErrorResponse {
  ErrorResponse({
    this.code,
    this.message,
  });

  ErrorResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
  }

  String? message;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    return map;
  }
}
