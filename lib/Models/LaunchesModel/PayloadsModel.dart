import 'OrbitParamsModel.dart';



class PayloadsModel {
  String payloadId;
  List<int> noradId;
  bool reused;
  List<String> customers;
  String nationality;
  String manufacturer;
  String payloadType;
  int payloadMassKg;
  int payloadMassLbs;
  String orbit;
  OrbitParams orbitParams;

  PayloadsModel({
    required this.payloadId,
    required this.noradId,
    required this.reused,
    required this.customers,
    required this.nationality,
    required this.manufacturer,
    required this.payloadType,
    required this.payloadMassKg,
    required this.payloadMassLbs,
    required this.orbit,
    required this.orbitParams,
  });

  factory PayloadsModel.fromJson(Map<String, dynamic> json) {
    return PayloadsModel(
      payloadId: json['payload_id'],
      noradId: List<int>.from(json['norad_id'] ?? []),
      reused: json['reused'],
      customers: List<String>.from(json['customers'] ?? []),
      nationality: json['nationality'],
      manufacturer: json['manufacturer'],
      payloadType: json['payload_type'],
      payloadMassKg: json['payload_mass_kg'],
      payloadMassLbs: json['payload_mass_lbs'],
      orbit: json['orbit'],
      orbitParams: OrbitParams.fromJson(json['orbit_params']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payload_id': payloadId,
      'norad_id': noradId,
      'reused': reused,
      'customers': customers,
      'nationality': nationality,
      'manufacturer': manufacturer,
      'payload_type': payloadType,
      'payload_mass_kg': payloadMassKg,
      'payload_mass_lbs': payloadMassLbs,
      'orbit': orbit,
      'orbit_params': orbitParams.toJson(),
    };
  }
}
