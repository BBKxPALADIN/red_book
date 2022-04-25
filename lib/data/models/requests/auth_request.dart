class AuthRequest {
  AuthRequest({
      String? login, 
      String? password,}){
    _login = login;
    _password = password;
}

  AuthRequest.fromJson(dynamic json) {
    _login = json['login'];
    _password = json['password'];
  }
  String? _login;
  String? _password;

  String? get login => _login;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['password'] = _password;
    return map;
  }

}