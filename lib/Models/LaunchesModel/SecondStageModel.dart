import 'PayloadsModel.dart';

class SecondStageModel {
  int block;
  List<PayloadsModel> payloads;

  SecondStageModel({required this.block, required this.payloads});

  factory SecondStageModel.fromJson(Map<String, dynamic> json) {
    return SecondStageModel(
      block: json['block'],
      payloads: (json['payloads'] as List).map((i) => PayloadsModel.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'block': block,
      'payloads': payloads.map((i) => i.toJson()).toList(),
    };
  }
}
