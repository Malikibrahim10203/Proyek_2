import 'package:flutter/material.dart';

class DashboardFarmer extends StatefulWidget {
  const DashboardFarmer({Key? key}) : super(key: key);

  @override
  State<DashboardFarmer> createState() => _DashboardFarmerState();
}

class _DashboardFarmerState extends State<DashboardFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Dashboard Farmer'),
    );
  }
}
