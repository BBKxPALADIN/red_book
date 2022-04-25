class NewUserRequest {
  NewUserRequest({
      String? fullName, 
      String? login, 
      String? password, 
      int? userTypeId,}){
    _fullName = fullName;
    _login = login;
    _password = password;
    _userTypeId = userTypeId;
}

  NewUserRequest.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _login = json['login'];
    _password = json['password'];
    _userTypeId = json['user_type_id'];
  }
  String? _fullName;
  String? _login;
  String? _password;
  int? _userTypeId;

  String? get fullName => _fullName;
  String? get login => _login;
  String? get password => _password;
  int? get userTypeId => _userTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['login'] = _login;
    map['password'] = _password;
    map['user_type_id'] = _userTypeId;
    return map;
  }

}