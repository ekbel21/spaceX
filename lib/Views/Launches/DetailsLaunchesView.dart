import 'package:flutter/material.dart';
import 'package:space_x/Models/LaunchesModel/LaunchesModel.dart';

class DetailsLaunchesView extends StatelessWidget {
  final LaunchesModel launch;

  const DetailsLaunchesView({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          launch.missionName ?? 'No mission name',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    'Mission name: ${launch.missionName}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  'Launch Year: ${launch.launchYear}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Launch Success: ${launch.launchSuccess}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
