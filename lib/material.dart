import 'package:flutter/material.dart';

import 'package:routes_app/consumer/material/routes/list.dart';
import 'package:routes_app/consumer/material/recording/recording_view.dart';

class MaterialApplication extends StatefulWidget {
  const MaterialApplication({super.key});

  @override
  State<MaterialApplication> createState() => _StateMaterialApplication();
}

class _StateMaterialApplication extends State<MaterialApplication> {
  final List<Widget> _navigationBarWidget = [
    const MaterialRouteList(),
    const MaterialRecordingView(),
  ];

  final List<String> _navigationBarTitles = [
    "Routes",
    "Recording"
  ];

  int _navigationBarIndex = 0;

  void _navigationBarItemPressed(int index) => setState(() => _navigationBarIndex = index);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _navigationBarTitles[_navigationBarIndex],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Routes App"),
      ),
      body: _navigationBarWidget[_navigationBarIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: const Icon(Icons.alt_route), label: _navigationBarTitles[0]),
          NavigationDestination(icon: const Icon(Icons.camera_alt), label: _navigationBarTitles[1])
        ],
        onDestinationSelected: _navigationBarItemPressed,
        selectedIndex: _navigationBarIndex,
      ),
    ),
    );
  }
}

