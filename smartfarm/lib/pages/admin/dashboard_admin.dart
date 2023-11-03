import 'package:flutter/material.dart';
import 'package:smartfarm/event/event_pref.dart';
import 'package:smartfarm/pages/login.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
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
