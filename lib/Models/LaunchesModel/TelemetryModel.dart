class TelemetryModel {
  String flightClub;

  TelemetryModel({required this.flightClub});

  factory TelemetryModel.fromJson(Map<String, dynamic> json) {
    return TelemetryModel(
      flightClub: json['flight_club'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flight_club': flightClub,
    };
  }
}
