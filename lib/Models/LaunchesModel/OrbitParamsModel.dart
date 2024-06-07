class OrbitParams {
  String referenceSystem;
  String regime;
  double longitude;
  double semiMajorAxisKm;
  double eccentricity;
  double periapsisKm;
  double apoapsisKm;
  double inclinationDeg;
  double periodMin;
  double lifespanYears;
  double epoch;
  double meanMotion;
  double raan;
  double argOfPericenter;
  double meanAnomaly;

  OrbitParams({
    required this.referenceSystem,
    required this.regime,
    required this.longitude,
    required this.semiMajorAxisKm,
    required this.eccentricity,
    required this.periapsisKm,
    required this.apoapsisKm,
    required this.inclinationDeg,
    required this.periodMin,
    required this.lifespanYears,
    required this.epoch,
    required this.meanMotion,
    required this.raan,
    required this.argOfPericenter,
    required this.meanAnomaly,
  });

  factory OrbitParams.fromJson(Map<String, dynamic> json) {
    return OrbitParams(
      referenceSystem: json['reference_system'],
      regime: json['regime'],
      longitude: json['longitude'],
      semiMajorAxisKm: json['semi_major_axis_km'],
      eccentricity: json['eccentricity'],
      periapsisKm: json['periapsis_km'],
      apoapsisKm: json['apoapsis_km'],
      inclinationDeg: json['inclination_deg'],
      periodMin: json['period_min'],
      lifespanYears: json['lifespan_years'],
      epoch: json['epoch'],
      meanMotion: json['mean_motion'],
      raan: json['raan'],
      argOfPericenter: json['arg_of_pericenter'],
      meanAnomaly: json['mean_anomaly'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference_system': referenceSystem,
      'regime': regime,
      'longitude': longitude,
      'semi_major_axis_km': semiMajorAxisKm,
      'eccentricity': eccentricity,
      'periapsis_km': periapsisKm,
      'apoapsis_km': apoapsisKm,
      'inclination_deg': inclinationDeg,
      'period_min': periodMin,
      'lifespan_years': lifespanYears,
      'epoch': epoch,
      'mean_motion': meanMotion,
      'raan': raan,
      'arg_of_pericenter': argOfPericenter,
      'mean_anomaly': meanAnomaly,
    };
  }
}
