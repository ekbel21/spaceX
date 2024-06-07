import 'LaunchFailureDetailsModel.dart';
import 'LaunchSiteModel.dart';
import 'LinksModel.dart';
import 'TelemetryModel.dart';
import 'TimelineModel.dart';

import 'rocketModel.dart';



class LaunchesModel {
  int flightNumber;
  String missionName;
  List<String> missionId;
  bool upcoming;
  String launchYear;
  int launchDateUnix;
  String launchDateUtc;
  String launchDateLocal;
  bool isTentative;
  String tentativeMaxPrecision;
  bool tbd;
  int launchWindow;
  Rocket rocket;
  List<String> ships;
  TelemetryModel telemetry;
  LaunchSiteModel launchSite;
  bool launchSuccess;
  LaunchFailureDetailsModel launchFailureDetails;
  LinksModel links;
  String details;
  String staticFireDateUtc;
  int staticFireDateUnix;
  TimelineModel timeline;
  String crew;

  LaunchesModel({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.isTentative,
    required this.tentativeMaxPrecision,
    required this.tbd,
    required this.launchWindow,
    required this.rocket,
    required this.ships,
    required this.telemetry,
    required this.launchSite,
    required this.launchSuccess,
    required this.launchFailureDetails,
    required this.links,
    required this.details,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.timeline,
    required this.crew
  });

  factory LaunchesModel.fromJson(Map<String, dynamic> json) {
    return LaunchesModel(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      missionId: List<String>.from(json['mission_id'] ?? []),
      upcoming: json['upcoming'],
      launchYear: json['launch_year'],
      launchDateUnix: json['launch_date_unix'],
      launchDateUtc: json['launch_date_utc'],
      launchDateLocal: json['launch_date_local'],
      isTentative: json['is_tentative'],
      tentativeMaxPrecision: json['tentative_max_precision'],
      tbd: json['tbd'],
      launchWindow: json['launch_window'],
      rocket: Rocket.fromJson(json['rocket']),
      ships: List<String>.from(json['ships'] ?? []),
      telemetry: TelemetryModel.fromJson(json['telemetry']),
      launchSite: LaunchSiteModel.fromJson(json['launch_site']),
      launchSuccess: json['launch_success'],
      launchFailureDetails: json['launch_failure_details'] != null 
          ? LaunchFailureDetailsModel.fromJson(json['launch_failure_details']) 
          : LaunchFailureDetailsModel(time: 0, altitude: 0, reason: ''),
      links: LinksModel.fromJson(json['links']),
      details: json['details'],
      staticFireDateUtc: json['static_fire_date_utc'],
      staticFireDateUnix: json['static_fire_date_unix'],
      timeline: TimelineModel.fromJson(json['timeline']),
      crew: json['crew']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flight_number': flightNumber,
      'mission_name': missionName,
      'mission_id': missionId,
      'upcoming': upcoming,
      'launch_year': launchYear,
      'launch_date_unix': launchDateUnix,
      'launch_date_utc': launchDateUtc,
      'launch_date_local': launchDateLocal,
      'is_tentative': isTentative,
      'tentative_max_precision': tentativeMaxPrecision,
      'tbd': tbd,
      'launch_window': launchWindow,
      'rocket': rocket.toJson(),
      'ships': ships,
      'telemetry': telemetry.toJson(),
      'launch_site': launchSite.toJson(),
      'launch_success': launchSuccess,
      'launch_failure_details': launchFailureDetails.toJson(),
      'links': links.toJson(),
      'details': details,
      'static_fire_date_utc': staticFireDateUtc,
      'static_fire_date_unix': staticFireDateUnix,
      'timeline': timeline.toJson(),
      'crew': crew,
    };
  }
}
