class ConfirmationRequest {
  ConfirmationRequest({
      int? coinsAmount, 
      String? comment, 
      int? confirmedBy, 
      bool? isConfirmed, 
      int? researchId,}){
    _coinsAmount = coinsAmount;
    _comment = comment;
    _confirmedBy = confirmedBy;
    _isConfirmed = isConfirmed;
    _researchId = researchId;
}

  ConfirmationRequest.fromJson(dynamic json) {
    _coinsAmount = json['coins_amount'];
    _comment = json['comment'];
    _confirmedBy = json['confirmed_by'];
    _isConfirmed = json['is_confirmed'];
    _researchId = json['research_id'];
  }
  int? _coinsAmount;
  String? _comment;
  int? _confirmedBy;
  bool? _isConfirmed;
  int? _researchId;

  int? get coinsAmount => _coinsAmount;
  String? get comment => _comment;
  int? get confirmedBy => _confirmedBy;
  bool? get isConfirmed => _isConfirmed;
  int? get researchId => _researchId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coins_amount'] = _coinsAmount;
    map['comment'] = _comment;
    map['confirmed_by'] = _confirmedBy;
    map['is_confirmed'] = _isConfirmed;
    map['research_id'] = _researchId;
    return map;
  }

}