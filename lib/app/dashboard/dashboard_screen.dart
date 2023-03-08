import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Dashboard'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          child: ElevatedButton(
            onPressed: () => 1,
            child: const Text('Item'),
          ),
        ),
        ElevatedButton(
          onPressed: () => 1,
          child: const Text('Search Item'),
        )
      ]),
    );
  }
}