import 'package:flutter/material.dart';
import 'package:try_hive/Screens/constants.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Custom Settings"),
    );
  }
}