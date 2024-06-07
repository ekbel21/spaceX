import 'package:flutter/material.dart';

class AppStyle {
  static const Color primaryColor = Colors.orange;
  static const Color backgroundColor = Colors.white;
  static const TextStyle selectedLabelStyle = TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle unselectedLabelStyle = TextStyle(fontWeight: FontWeight.normal);
  static const ColorFilter backgroundFilter = ColorFilter.mode(
    Colors.white54,
    BlendMode.dstATop,
  );
  static const BoxDecoration launchBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("lib/assets/images/LaunchesBackground.jpg"),
      fit: BoxFit.cover,
      colorFilter: backgroundFilter,
    ),
  );
  static const BoxDecoration missionBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage("lib/assets/images/MissionsBackground.png"),
      fit: BoxFit.cover,
      colorFilter: backgroundFilter,
    ),
  );
}
