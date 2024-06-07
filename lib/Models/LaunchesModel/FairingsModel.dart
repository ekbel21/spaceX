class FairingsModel {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  String ship;

  FairingsModel({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered,
    required this.ship,
  });

  factory FairingsModel.fromJson(Map<String, dynamic> json) {
    return FairingsModel(
      reused: json['reused'],
      recoveryAttempt: json['recovery_attempt'],
      recovered: json['recovered'],
      ship: json['ship'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reused': reused,
      'recovery_attempt': recoveryAttempt,
      'recovered': recovered,
      'ship': ship,
    };
  }
}
