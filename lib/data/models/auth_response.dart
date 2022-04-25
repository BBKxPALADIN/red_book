
class AuthResponse {
  AuthResponse({
      int? userId, 
      String? userType,}){
    _userId = userId;
    _userType = userType;
}

  AuthResponse.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userType = json['user_type'];
  }
  int? _userId;
  String? _userType;

  int? get userId => _userId;
  String? get userType => _userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    return map;
  }

}