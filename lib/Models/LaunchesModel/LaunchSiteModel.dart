class LaunchSiteModel {
  String siteId;
  String siteName;
  String siteNameLong;

  LaunchSiteModel({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSiteModel.fromJson(Map<String, dynamic> json) {
    return LaunchSiteModel(
      siteId: json['site_id'],
      siteName: json['site_name'],
      siteNameLong: json['site_name_long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'site_id': siteId,
      'site_name': siteName,
      'site_name_long': siteNameLong,
    };
  }
}
