import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Travel Planner"),
        ),
        body: const Center(
          child: Text(
            "Travel Planner",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    ),
  );
}