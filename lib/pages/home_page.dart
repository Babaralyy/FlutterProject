import 'package:first_fluuter_project/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.white),
        ),

      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text("Welcome to 30 days flutter"),
      ),
    );
  }
}
