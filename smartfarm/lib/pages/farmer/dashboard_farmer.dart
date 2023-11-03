import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/login.dart';


class DashboardFarmer extends StatefulWidget {
  const DashboardFarmer({Key? key}) : super(key: key);

  @override
  State<DashboardFarmer> createState() => _DashboardFarmerState();
}

class _DashboardFarmerState extends State<DashboardFarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OutlinedButton(
          onPressed: () {
            EventPref.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: Text('LogOut'),
        ),
      ),
    );
  }
}
