class SubTypeResponse {
  SubTypeResponse({
      List<CreatureSubTypes>? creatureSubTypes, 
      int? count,}){
    _creatureSubTypes = creatureSubTypes;
    _count = count;
}

  SubTypeResponse.fromJson(dynamic json) {
    if (json['creature_sub_types'] != null) {
      _creatureSubTypes = [];
      json['creature_sub_types'].forEach((v) {
        _creatureSubTypes?.add(CreatureSubTypes.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<CreatureSubTypes>? _creatureSubTypes;
  int? _count;

  List<CreatureSubTypes>? get creatureSubTypes => _creatureSubTypes;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_creatureSubTypes != null) {
      map['creature_sub_types'] = _creatureSubTypes?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class CreatureSubTypes {
  CreatureSubTypes({
      int? id, 
      String? name, 
      String? alias, 
      int? creatureTypeId,}){
    _id = id;
    _name = name;
    _alias = alias;
    _creatureTypeId = creatureTypeId;
}

  CreatureSubTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
    _creatureTypeId = json['creature_type_id'];
  }
  int? _id;
  String? _name;
  String? _alias;
  int? _creatureTypeId;

  int? get id => _id;
  String? get name => _name;
  String? get alias => _alias;
  int? get creatureTypeId => _creatureTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    map['creature_type_id'] = _creatureTypeId;
    return map;
  }

}