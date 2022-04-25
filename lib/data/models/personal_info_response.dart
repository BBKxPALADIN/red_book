class PersonalInfoResponse {
  PersonalInfoResponse({
      int? id, 
      String? fullName, 
      int? userTypeId, 
      String? userType, 
      String? login, 
      String? password, 
      int? subTypeId, 
      String? subType,}){
    _id = id;
    _fullName = fullName;
    _userTypeId = userTypeId;
    _userType = userType;
    _login = login;
    _password = password;
    _subTypeId = subTypeId;
    _subType = subType;
}

  PersonalInfoResponse.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _userTypeId = json['user_type_id'];
    _userType = json['user_type'];
    _login = json['login'];
    _password = json['password'];
    _subTypeId = json['sub_type_id'];
    _subType = json['sub_type'];
  }
  int? _id;
  String? _fullName;
  int? _userTypeId;
  String? _userType;
  String? _login;
  String? _password;
  int? _subTypeId;
  String? _subType;

  int? get id => _id;
  String? get fullName => _fullName;
  int? get userTypeId => _userTypeId;
  String? get userType => _userType;
  String? get login => _login;
  String? get password => _password;
  int? get subTypeId => _subTypeId;
  String? get subType => _subType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['user_type_id'] = _userTypeId;
    map['user_type'] = _userType;
    map['login'] = _login;
    map['password'] = _password;
    map['sub_type_id'] = _subTypeId;
    map['sub_type'] = _subType;
    return map;
  }

}