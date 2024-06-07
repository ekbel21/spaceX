import 'CoresModel.dart';
class FirstStageModel {
  List<CoresModel> cores;

  FirstStageModel({required this.cores});

  factory FirstStageModel.fromJson(Map<String, dynamic> json) {
    return FirstStageModel(
      cores: (json['cores'] as List).map((i) => CoresModel.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cores': cores.map((i) => i.toJson()).toList(),
    };
  }
}
