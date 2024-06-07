import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/Controllers/LaunchesController.dart';
import 'package:space_x/Controllers/MissionsController.dart';
import 'package:space_x/Models/LaunchesModel/LaunchesModel.dart';
import 'package:space_x/Models/MissionsModel.dart';
import 'package:space_x/Views/Launches/LaunchesCellView.dart';
import 'package:space_x/Views/Missions/MissionsCellView.dart';
import 'package:space_x/styles/AppStyle.dart';
import 'package:space_x/Providers/LaunchesProvider.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaunchesProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const NavigationExample(),
      ),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int _selectedIndex = 0;
  String _searchText = '';
  bool _isFiltered = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
    });
  }

  void _onFilterButtonPressed() {
    setState(() {
      _isFiltered = !_isFiltered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
               decoration: AppStyle.launchBackgroundDecoration,

        child: Column(
          children: [
            Container(
              color: AppStyle.primaryColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: _onSearchTextChanged,
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(_isFiltered ? Icons.filter_alt : Icons.filter_alt_outlined),
                          color: Colors.white,
                          onPressed: _onFilterButtonPressed,
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.airplanemode_active),
                        label: 'Launches',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.adjust),
                        label: 'Missions',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    selectedItemColor: AppStyle.primaryColor,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedLabelStyle: AppStyle.selectedLabelStyle,
                    unselectedLabelStyle: AppStyle.unselectedLabelStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _selectedIndex == 0 ? _buildLaunches() : _buildMissions(),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildLaunches() {
    return Consumer<LaunchesProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.launches.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          List<LaunchesModel> filteredLaunches = provider.launches.where((launch) {
            bool matchesSearch = launch.launchDateLocal.contains(_searchText) ||
                launch.flightNumber.toString().contains(_searchText);
            bool matchesFilter = !_isFiltered ;
            return matchesSearch && matchesFilter;
          }).toList();

          return ListView.builder(
            itemCount: filteredLaunches.length,
            itemBuilder: (context, index) {
              return LaunchesCellView(filteredLaunches[index]);
            },
          );
        }
      },
    );
  }

 Widget _buildMissions() {
  return Material(
    child: Container(
      decoration: AppStyle.missionBackgroundDecoration,
      child: FutureBuilder(
        future: MissionsController().getAllMissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<MissionsModel> missions = snapshot.data!;
           List<MissionsModel> filteredMissions = missions.where((mission) {
  return mission.missionName?.toLowerCase().contains(_searchText.toLowerCase()) ?? false;
}).toList();

            return ListView.builder(
              itemCount: filteredMissions.length,
              itemBuilder: (context, index) {
                return MissionsCellView(filteredMissions[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    ),
  );
}

}
