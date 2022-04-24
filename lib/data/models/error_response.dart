class ErrorResponse {
  ErrorResponse({
    this.description,
    this.status,
  });

  ErrorResponse.fromJson(dynamic json) {
    description = json['description'];
    status = json['status'];
  }

  String? description;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['status'] = status;
    return map;
  }
}
