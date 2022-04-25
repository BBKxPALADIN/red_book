class UserTypesResponse {
  UserTypesResponse({
      List<UserTypes>? userTypes, 
      int? count,}){
    _userTypes = userTypes;
    _count = count;
}

  UserTypesResponse.fromJson(dynamic json) {
    if (json['user_types'] != null) {
      _userTypes = [];
      json['user_types'].forEach((v) {
        _userTypes?.add(UserTypes.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<UserTypes>? _userTypes;
  int? _count;

  List<UserTypes>? get userTypes => _userTypes;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userTypes != null) {
      map['user_types'] = _userTypes?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class UserTypes {
  UserTypes({
      int? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  UserTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
  }
  int? _id;
  String? _name;
  String? _alias;

  int? get id => _id;
  String? get name => _name;
  String? get alias => _alias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    return map;
  }

}