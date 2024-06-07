import 'package:flutter/material.dart';
import 'package:space_x/Models/LaunchesModel/LaunchesModel.dart';
import 'package:hive/hive.dart';
import 'package:space_x/Controllers/LaunchesController.dart';

class LaunchesProvider with ChangeNotifier {
  List<LaunchesModel> _launches = [];
  bool _isLoading = false;

  List<LaunchesModel> get launches => _launches;
  bool get isLoading => _isLoading;

  LaunchesProvider() {
    _loadLaunches();
  }

  Future<void> _loadLaunches() async {
    _isLoading = true;
    notifyListeners();

    var box = await Hive.openBox<LaunchesModel>('launches');
    _launches = box.values.toList();

    if (_launches.isEmpty) {
      await fetchLaunchesFromNetwork();
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLaunchesFromNetwork() async {
    try {
      List<LaunchesModel> launches = await LaunchesController().getAllLaunches();
      var box = await Hive.openBox<LaunchesModel>('launches');
      await box.clear();
      await box.addAll(launches);
      _launches = launches;
    } catch (e) {
      print("Error fetching launches: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
