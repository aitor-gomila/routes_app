import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state.dart';

class RoutesList extends StatelessWidget {
  const RoutesList({super.key, required this.onItemPressed});

  final void Function(BuildContext, int) onItemPressed;

  @override
  Widget build (BuildContext context) {
      return Consumer<RouteState>(
          builder: (context, state, _) {
              var routes = state.routes;
              return ListView.builder(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                      var route = routes[index];

                      if (route.length <= 1) return const SizedBox();

                      return InkWell(
                        child: Text(route.first.timestamp.toString()),
                        onTap: () => onItemPressed(context, index),
                      );
                  }
              );
          }
      );
  }
}
