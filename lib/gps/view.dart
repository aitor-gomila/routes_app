import 'package:flutter/material.dart';
import 'package:routes_app/gps/state.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.route});

  final GPSRoute route;

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
        ...route.map((position) => Text(position.toString())).toList()
       ]
    );
  }
}
