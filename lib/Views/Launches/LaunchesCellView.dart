import 'package:flutter/material.dart';
import 'package:space_x/Models/LaunchesModel/LaunchesModel.dart';
import './DetailsLaunchesView.dart';

class LaunchesCellView extends StatelessWidget {
  final LaunchesModel launches;

  LaunchesCellView(this.launches, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsLaunchesView(launch: launches),
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
                      launches.launchDateLocal,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Text(
                    'Launch ID: ${launches.flightNumber}',
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
