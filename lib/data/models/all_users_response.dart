
class AllUsersResponse {
  AllUsersResponse({
      List<Users>? users, 
      int? count,}){
    _users = users;
    _count = count;
}

  AllUsersResponse.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Users>? _users;
  int? _count;

  List<Users>? get users => _users;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Users {
  Users({
      int? id, 
      String? fullName, 
      int? userTypeId, 
      String? userType, 
      String? login, 
      String? password, 
      dynamic subTypeId, 
      dynamic subType,}){
    _id = id;
    _fullName = fullName;
    _userTypeId = userTypeId;
    _userType = userType;
    _login = login;
    _password = password;
    _subTypeId = subTypeId;
    _subType = subType;
}

  Users.fromJson(dynamic json) {
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
  dynamic _subTypeId;
  dynamic _subType;

  int? get id => _id;
  String? get fullName => _fullName;
  int? get userTypeId => _userTypeId;
  String? get userType => _userType;
  String? get login => _login;
  String? get password => _password;
  dynamic get subTypeId => _subTypeId;
  dynamic get subType => _subType;

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