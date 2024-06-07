import 'dart:convert';
import 'package:space_x/Models/MissionsModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class MissionsController {
  static final MissionsController _instance = MissionsController._internal();

  factory MissionsController() {
    return _instance;
  }

  MissionsController._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'xspace.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE missions (
            mission_id TEXT PRIMARY KEY,
            mission_name TEXT,
            manufacturers TEXT,
            payload_ids TEXT,
            wikipedia TEXT,
            website TEXT,
            twitter TEXT,
            description TEXT
          )
          '''
        );
      },
    );
  }

  Future<List<MissionsModel>> getAllMissions() async {
    var url = Uri.parse("https://api.spacexdata.com/v3/missions");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> rawMissions = json.decode(response.body);
      List<MissionsModel> missions = rawMissions.map((json) => MissionsModel.fromJson(json)).toList();
      return missions;
    } else {
      throw Exception("Failed to load missions");
    }
  }

  Future<void> saveMission(MissionsModel mission) async {
    final db = await database;
    await db.insert('missions', mission.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MissionsModel>> fetchMissions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('missions');
    return List.generate(maps.length, (i) {
      return MissionsModel(
        missionName: maps[i]['mission_name'],
        missionId: maps[i]['mission_id'],
        manufacturers: (maps[i]['manufacturers'] as String).split(','),
        payloadIds: (maps[i]['payload_ids'] as String).split(','),
        wikipedia: maps[i]['wikipedia'],
        website: maps[i]['website'],
        twitter: maps[i]['twitter'],
        description: maps[i]['description'],
      );
    });
  }

  Future<MissionsModel> getMissionById(String missionId) async {
    var url = Uri.parse("https://api.spacexdata.com/v4/missions/$missionId");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return MissionsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load mission');
    }
  }
}
