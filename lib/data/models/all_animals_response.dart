class AllAnimalsResponse {
  AllAnimalsResponse({
      int? count, 
      List<Creatures>? creatures,}){
    _count = count;
    _creatures = creatures;
}

  AllAnimalsResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['creatures'] != null) {
      _creatures = [];
      json['creatures'].forEach((v) {
        _creatures?.add(Creatures.fromJson(v));
      });
    }
  }
  int? _count;
  List<Creatures>? _creatures;

  int? get count => _count;
  List<Creatures>? get creatures => _creatures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_creatures != null) {
      map['creatures'] = _creatures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Creatures {
  Creatures({
      String? description, 
      String? name, 
      int? remainingCount, 
      int? subTypeId,}){
    _description = description;
    _name = name;
    _remainingCount = remainingCount;
    _subTypeId = subTypeId;
}

  Creatures.fromJson(dynamic json) {
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