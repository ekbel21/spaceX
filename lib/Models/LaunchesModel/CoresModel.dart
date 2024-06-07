class CoresModel {
  String coreSerial;
  int flight;
  int block;
  bool gridfins;
  bool legs;
  bool reused;
  bool landSuccess;
  bool landingIntent;
  String landingType;
  String landingVehicle;

  CoresModel({
    required this.coreSerial,
    required this.flight,
    required this.block,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landSuccess,
    required this.landingIntent,
    required this.landingType,
    required this.landingVehicle,
  });

  factory CoresModel.fromJson(Map<String, dynamic> json) {
    return CoresModel(
      coreSerial: json['core_serial'],
      flight: json['flight'],
      block: json['block'],
      gridfins: json['gridfins'],
      legs: json['legs'],
      reused: json['reused'],
      landSuccess: json['land_success'],
      landingIntent: json['landing_intent'],
      landingType: json['landing_type'],
      landingVehicle: json['landing_vehicle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'core_serial': coreSerial,
      'flight': flight,
      'block': block,
      'gridfins': gridfins,
      'legs': legs,
      'reused': reused,
      'land_success': landSuccess,
      'landing_intent': landingIntent,
      'landing_type': landingType,
      'landing_vehicle': landingVehicle,
    };
  }
}
