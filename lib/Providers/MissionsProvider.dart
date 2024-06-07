/*import 'package:flutter/material.dart';
import 'package:space_x/Controllers/MissionsController.dart';
import 'package:space_x/Models/MissionsModel.dart';

class MissionsProvider extends ChangeNotifier {
  List<MissionsModel> _missions = [];
  bool _isLoading = false;

  List<MissionsModel> get missions => _missions;
  bool get isLoading => _isLoading;

  MissionsProvider() {
    _init();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();
    await MissionsController().initHive();
    await fetchMissions();
  }

  Future<void> fetchMissions() async {
    try {
      _missions = await MissionsController().fetchMissions();
    } catch (e) {
      print("Error fetching missions: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}*/
