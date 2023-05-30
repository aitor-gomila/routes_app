import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routes_app/server/route.dart';
import 'package:routes_app/consumer/material/routes/view.dart';

class MaterialRouteList extends StatelessWidget {
  const MaterialRouteList({super.key});

  void _routeItemPressed(BuildContext context, int index) {
    var state = context.read<RouteList>();
    var routes = state.routes;
    var route = routes[index];

    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialRouteViewFullscreen(route)));
  }

  @override
  Widget build (BuildContext context) {
      return Consumer<RouteList>(
          builder: (context, state, _) {
              var routes = state.routes;
              return ListView.builder(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                      var route = routes[index];

                      if (route.length <= 1) return const SizedBox();

                      return InkWell(
                        child: Text(route.first.timestamp.toString()),
                        onTap: () => _routeItemPressed(context, index),
                      );
                  }
              );
          }
      );
  }
}
