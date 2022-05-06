class NewResearchRequest {
  NewResearchRequest({
      Creature? creature, 
      int? userId,}){
    _creature = creature;
    _userId = userId;
}

  NewResearchRequest.fromJson(dynamic json) {
    _creature = json['creature'] != null ? Creature.fromJson(json['creature']) : null;
    _userId = json['user_id'];
  }
  Creature? _creature;
  int? _userId;

  Creature? get creature => _creature;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_creature != null) {
      map['creature'] = _creature?.toJson();
    }
    map['user_id'] = _userId;
    return map;
  }

}

class Creature {
  Creature({
      String? description, 
      String? name, 
      int? remainingCount, 
      int? subTypeId,}){
    _description = description;
    _name = name;
    _remainingCount = remainingCount;
    _subTypeId = subTypeId;
}

  Creature.fromJson(dynamic json) {
    _description = json['description'];
    _name = json['name'];
    _remainingCount = json['remaining_count'];
    _subTypeId = json['sub_type_id'];
  }
  String? _description;
  String? _name;
  int? _remainingCount;
  int? _subTypeId;

  String? get description => _description;
  String? get name => _name;
  int? get remainingCount => _remainingCount;
  int? get subTypeId => _subTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = _description;
    map['name'] = _name;
    map['remaining_count'] = _remainingCount;
    map['sub_type_id'] = _subTypeId;
    return map;
  }

}