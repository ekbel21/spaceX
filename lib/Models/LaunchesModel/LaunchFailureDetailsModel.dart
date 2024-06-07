class LaunchFailureDetailsModel {
  int time;
  int altitude;
  String reason;

  LaunchFailureDetailsModel({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory LaunchFailureDetailsModel.fromJson(Map<String, dynamic> json) {
    return LaunchFailureDetailsModel(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'altitude': altitude,
      'reason': reason,
    };
  }
}
