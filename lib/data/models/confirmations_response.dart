class ConfirmationsResponse {
  ConfirmationsResponse({
      List<Confirmations>? confirmations, 
      int? count,}){
    _confirmations = confirmations;
    _count = count;
}

  ConfirmationsResponse.fromJson(dynamic json) {
    if (json['confirmations'] != null) {
      _confirmations = [];
      json['confirmations'].forEach((v) {
        _confirmations?.add(Confirmations.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Confirmations>? _confirmations;
  int? _count;

  List<Confirmations>? get confirmations => _confirmations;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_confirmations != null) {
      map['confirmations'] = _confirmations?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Confirmations {
  Confirmations({
      int? id, 
      int? researchId, 
      bool? isConfirmed, 
      String? comment, 
      int? coinsAmount, 
      int? confirmedBy,}){
    _id = id;
    _researchId = researchId;
    _isConfirmed = isConfirmed;
    _comment = comment;
    _coinsAmount = coinsAmount;
    _confirmedBy = confirmedBy;
}

  Confirmations.fromJson(dynamic json) {
    _id = json['id'];
    _researchId = json['research_id'];
    _isConfirmed = json['is_confirmed'];
    _comment = json['comment'];
    _coinsAmount = json['coins_amount'];
    _confirmedBy = json['confirmed_by'];
  }
  int? _id;
  int? _researchId;
  bool? _isConfirmed;
  String? _comment;
  int? _coinsAmount;
  int? _confirmedBy;

  int? get id => _id;
  int? get researchId => _researchId;
  bool? get isConfirmed => _isConfirmed;
  String? get comment => _comment;
  int? get coinsAmount => _coinsAmount;
  int? get confirmedBy => _confirmedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['research_id'] = _researchId;
    map['is_confirmed'] = _isConfirmed;
    map['comment'] = _comment;
    map['coins_amount'] = _coinsAmount;
    map['confirmed_by'] = _confirmedBy;
    return map;
  }

}