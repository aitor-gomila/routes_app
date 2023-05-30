import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

typedef GPSRoute = List<Position>;

class RouteList extends ChangeNotifier {
    late final BuildContext context;

    RouteList(this.context);

    final List<GPSRoute> _routes = [];
    List<GPSRoute> get routes => _routes;

    void _saveRoutes(List<GPSRoute> routes) {

    }

    @override
    void notifyListeners() {
      super.notifyListeners();
      _saveRoutes(routes);
    }

    @override
    void dispose() {
      super.dispose();
      _saveRoutes(routes);
    }

    void add(GPSRoute route) {
        _routes.add(route);
        notifyListeners();
    }

    void removeAt(int index) {
        _routes.removeAt(index);
        notifyListeners();
    }
}
