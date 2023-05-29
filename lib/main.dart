import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gps/recording.dart';
import 'gps/state.dart';
import 'gps/list.dart';
import 'gps/view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RouteState(),
        ),
        Provider(create: (context) => RecordingService(context))
      ],
      child: const Application(),
    )
  );
}


class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onItemPressed(BuildContext context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      var state = context.read<RouteState>();
      var routes = state.routes;
      var route = routes[index];

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(route.first.timestamp.toString())
        ),
        body: RouteView(route: route)
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Routes App"),
      ),
      body: RoutesList(onItemPressed: _onItemPressed)
    );
  }
}
