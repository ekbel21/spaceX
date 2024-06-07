import 'package:flutter/material.dart';
import 'package:space_x/Models/MissionsModel.dart';

class DetailsMissionsView extends StatelessWidget {
  final MissionsModel currentMission;

  const DetailsMissionsView({super.key, required this.currentMission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          currentMission.missionName ?? 'No mission name',
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
                    'Mission name: ${currentMission.missionName}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  'Mission ID: ${currentMission.missionId}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Manufacturers: ${currentMission.manufacturers?.join(', ') ?? 'N/A'}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Payload IDs: ${currentMission.payloadIds?.join(', ') ?? 'N/A'}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Description: ${currentMission.description ?? 'No description available'}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Wikipedia: ${currentMission.wikipedia ?? 'N/A'}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Website: ${currentMission.website ?? 'N/A'}',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                Text(
                  'Twitter: ${currentMission.twitter ?? 'N/A'}',
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
