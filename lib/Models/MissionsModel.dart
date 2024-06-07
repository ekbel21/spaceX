import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class MissionsModel {
  @HiveField(0)
  String? missionName;
  @HiveField(1)
  String? missionId;
  @HiveField(2)
  List<String>? manufacturers;
  @HiveField(3)
  List<String>? payloadIds;
  @HiveField(4)
  String? wikipedia;
  @HiveField(5)
  String? website;
  @HiveField(6)
  String? twitter;
  @HiveField(7)
  String? description;

  MissionsModel({
    this.missionName,
    this.missionId,
    this.manufacturers,
    this.payloadIds,
    this.wikipedia,
    this.website,
    this.twitter,
    this.description,
  });

  MissionsModel.fromJson(Map<String, dynamic> json) {
    missionName = json['mission_name'];
    missionId = json['mission_id'];
    manufacturers = (json['manufacturers'] as List<dynamic>?)?.cast<String>();
    payloadIds = (json['payload_ids'] as List<dynamic>?)?.cast<String>();
    wikipedia = json['wikipedia'];
    website = json['website'];
    twitter = json['twitter'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mission_name'] = missionName;
    data['mission_id'] = missionId;
    data['manufacturers'] = manufacturers;
    data['payload_ids'] = payloadIds;
    data['wikipedia'] = wikipedia;
    data['website'] = website;
    data['twitter'] = twitter;
    data['description'] = description;
    return data;
  }
}

class MissionsModelAdapter extends TypeAdapter<MissionsModel> {
  @override
  final typeId = 1;

  @override
  MissionsModel read(BinaryReader reader) {
    return MissionsModel(
      missionName: reader.readString(),
      missionId: reader.readString(),
      manufacturers: (reader.readStringList() ?? []).cast<String>(),
      payloadIds: (reader.readStringList() ?? []).cast<String>(),
      wikipedia: reader.readString(),
      website: reader.readString(),
      twitter: reader.readString(),
      description: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, MissionsModel obj) {
    writer.writeString(obj.missionName ?? '');
    writer.writeString(obj.missionId ?? '');
    writer.writeStringList(obj.manufacturers ?? []);
    writer.writeStringList(obj.payloadIds ?? []);
    writer.writeString(obj.wikipedia ?? '');
    writer.writeString(obj.website ?? '');
    writer.writeString(obj.twitter ?? '');
    writer.writeString(obj.description ?? '');
  }
}
