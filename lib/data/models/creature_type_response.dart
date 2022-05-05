class CreatureTypeResponse {
  CreatureTypeResponse({
      List<CreatureTypes>? creatureTypes, 
      int? count,}){
    _creatureTypes = creatureTypes;
    _count = count;
}

  CreatureTypeResponse.fromJson(dynamic json) {
    if (json['creature_types'] != null) {
      _creatureTypes = [];
      json['creature_types'].forEach((v) {
        _creatureTypes?.add(CreatureTypes.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<CreatureTypes>? _creatureTypes;
  int? _count;

  List<CreatureTypes>? get creatureTypes => _creatureTypes;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_creatureTypes != null) {
      map['creature_types'] = _creatureTypes?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class CreatureTypes {
  CreatureTypes({
      int? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  CreatureTypes.fromJson(dynamic json) {
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