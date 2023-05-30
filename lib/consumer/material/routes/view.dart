import 'package:flutter/material.dart';

import 'package:routes_app/server/route.dart';

class MaterialRouteView extends StatelessWidget {
  const MaterialRouteView(this.route, {super.key});

  final GPSRoute route;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...route.map((position) => Text(position.toString())).toList()
    ]);
  }
}

class MaterialRouteViewFullscreen extends StatelessWidget {
  const MaterialRouteViewFullscreen(this.route, {super.key});

  final GPSRoute route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(route.first.timestamp.toString())),
        body: MaterialRouteView(route));
  }
}
