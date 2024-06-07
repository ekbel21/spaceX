import 'FairingsModel.dart';
import 'FirstStageModel.dart';
import 'SecondStageModel.dart';




class Rocket {
  String rocketId;
  String rocketName;
  String rocketType;
  FirstStageModel firstStage;
  SecondStageModel secondStage;
  FairingsModel fairings;

  Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
    required this.firstStage,
    required this.secondStage,
    required this.fairings,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      rocketId: json['rocket_id'],
      rocketName: json['rocket_name'],
      rocketType: json['rocket_type'],
      firstStage: FirstStageModel.fromJson(json['first_stage']),
      secondStage: SecondStageModel.fromJson(json['second_stage']),
      fairings: FairingsModel.fromJson(json['fairings']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rocket_id': rocketId,
      'rocket_name': rocketName,
      'rocket_type': rocketType,
      'first_stage': firstStage.toJson(),
      'second_stage': secondStage.toJson(),
      'fairings': fairings.toJson(),
    };
  }
}
