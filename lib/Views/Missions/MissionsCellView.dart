import 'package:flutter/material.dart';
import '../../Models/MissionsModel.dart';
import 'DetailsMissionsView.dart';

class MissionsCellView extends StatelessWidget {
  final MissionsModel missions;

  MissionsCellView(this.missions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsMissionsView(currentMission: missions),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      missions.missionName.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Text(
                    'Mission ID: ${missions.missionId.toString()}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
