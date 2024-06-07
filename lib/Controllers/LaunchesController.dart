import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:space_x/Models/LaunchesModel/LaunchesModel.dart';
import 'package:http/http.dart' as http;

class LaunchesController {
  static const String launchesBoxName = "launchesBox";

  Future<List<LaunchesModel>> getAllLaunches() async {
    List<LaunchesModel> launches = [];
    var url = Uri.parse("https://api.spacexdata.com/v3/launches");

    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        List<dynamic> rawLaunches = json.decode(res.body);
        for (var item in rawLaunches) {
          launches.add(LaunchesModel.fromJson(item));
        }
        await _saveToHive(launches);
      } else {
        print("Something went wrong! Try again.");
      }
    } catch (e) {
      print("Error fetching launches: $e");
    }

    return launches;
  }

  Future<void> _saveToHive(List<LaunchesModel> launches) async {
    var box = await Hive.openBox<LaunchesModel>(launchesBoxName);
    await box.clear();
    await box.addAll(launches);
  }

  Future<List<LaunchesModel>> fetchLaunchesFromCache() async {
    var box = await Hive.openBox<LaunchesModel>(launchesBoxName);
    return box.values.toList();
  }
}
