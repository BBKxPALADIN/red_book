class AllResearchesResponse {
  AllResearchesResponse({
      List<Researches>? researches, 
      int? count,}){
    _researches = researches;
    _count = count;
}

  AllResearchesResponse.fromJson(dynamic json) {
    if (json['researches'] != null) {
      _researches = [];
      json['researches'].forEach((v) {
        _researches?.add(Researches.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Researches>? _researches;
  int? _count;

  List<Researches>? get researches => _researches;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_researches != null) {
      map['researches'] = _researches?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Researches {
  Researches({
      int? id, 
      Creature? creature, 
      int? userId,}){
    _id = id;
    _creature = creature;
    _userId = userId;
}

  Researches.fromJson(dynamic json) {
    _id = json['id'];
    _creature = json['creature'] != null ? Creature.fromJson(json['creature']) : null;
    _userId = json['user_id'];
  }
  int? _id;
  Creature? _creature;
  int? _userId;

  int? get id => _id;
  Creature? get creature => _creature;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_creature != null) {
      map['creature'] = _creature?.toJson();
    }
    map['user_id'] = _userId;
    return map;
  }

}

class Creature {
  Creature({
      int? id, 
      String? name, 
      int? remainingCount, 
      String? description, 
      int? subTypeId,}){
    _id = id;
    _name = name;
    _remainingCount = remainingCount;
    _description = description;
    _subTypeId = subTypeId;
}

  Creature.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _remainingCount = json['remaining_count'];
    _description = json['description'];
    _subTypeId = json['sub_type_id'];
  }
  int? _id;
  String? _name;
  int? _remainingCount;
  String? _description;
  int? _subTypeId;

  int? get id => _id;
  String? get name => _name;
  int? get remainingCount => _remainingCount;
  String? get description => _description;
  int? get subTypeId => _subTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['remaining_count'] = _remainingCount;
    map['description'] = _description;
    map['sub_type_id'] = _subTypeId;
    return map;
  }

}