class MissionsModel {
  String? missionName;
  String? missionId;
  List<String>? manufacturers;
  List<String>? payloadIds;
  String? wikipedia;
  String? website;
  String? twitter;
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
