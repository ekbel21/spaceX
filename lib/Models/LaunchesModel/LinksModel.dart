class LinksModel {
  String missionPatch;
  String missionPatchSmall;
  String redditCampaign;
  String redditLaunch;
  String redditRecovery;
  String redditMedia;
  String presskit;
  String articleLink;
  String wikipedia;
  String videoLink;
  String youtubeId;
  List<String> flickrImages;

  LinksModel({
    required this.missionPatch,
    required this.missionPatchSmall,
    required this.redditCampaign,
    required this.redditLaunch,
    required this.redditRecovery,
    required this.redditMedia,
    required this.presskit,
    required this.articleLink,
    required this.wikipedia,
    required this.videoLink,
    required this.youtubeId,
    required this.flickrImages,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      missionPatch: json['mission_patch'],
      missionPatchSmall: json['mission_patch_small'],
      redditCampaign: json['reddit_campaign'],
      redditLaunch: json['reddit_launch'],
      redditRecovery: json['reddit_recovery'],
      redditMedia: json['reddit_media'],
      presskit: json['presskit'],
      articleLink: json['article_link'],
      wikipedia: json['wikipedia'],
      videoLink: json['video_link'],
      youtubeId: json['youtube_id'],
      flickrImages: List<String>.from(json['flickr_images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mission_patch': missionPatch,
      'mission_patch_small': missionPatchSmall,
      'reddit_campaign': redditCampaign,
      'reddit_launch': redditLaunch,
      'reddit_recovery': redditRecovery,
      'reddit_media': redditMedia,
      'presskit': presskit,
      'article_link': articleLink,
      'wikipedia': wikipedia,
      'video_link': videoLink,
      'youtube_id': youtubeId,
      'flickr_images': flickrImages,
    };
  }
}
