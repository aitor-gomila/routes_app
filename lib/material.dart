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

  int _navigationBarIndex = 0;

  void _navigationBarItemPressed(int index) => setState(() => _navigationBarIndex = index);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes App",
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
        destinations: const [
          NavigationDestination(icon: Icon(Icons.alt_route), label: "Routes"),
          NavigationDestination(icon: Icon(Icons.camera_alt), label: "Recording")
        ],
        onDestinationSelected: _navigationBarItemPressed,
        selectedIndex: _navigationBarIndex,
      ),
    ),
    );
  }
}

