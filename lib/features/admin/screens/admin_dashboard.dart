import 'package:flutter/material.dart';


class AdminDash extends StatefulWidget {
  static const String routeName = '/admin-dash';
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Admin Dashboard"),
      ),
    );
  }
}
