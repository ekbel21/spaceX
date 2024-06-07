class TimelineModel {
  int webcastLiftoff;

  TimelineModel({required this.webcastLiftoff});

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      webcastLiftoff: json['webcast_liftoff'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'webcast_liftoff': webcastLiftoff,
    };
  }
}
