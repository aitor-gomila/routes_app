import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';
import 'package:geolocator/geolocator.dart';

import 'package:routes_app/static/disposable.dart';

import 'package:routes_app/server/route.dart';

class RecordingService extends Disposable {
    late final RouteList _routeList;
    final GPSRoute _currentRecording = [];

    Future<Position> _getCurrentLocation() {
      return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    }

    Future<void> _addCurrentLocation() async {
      _currentRecording.add(await _getCurrentLocation());
    }

    void _clearCurrentRecording() {
      _currentRecording.clear();
    }

    final Duration _timerInterval = const Duration(seconds: 5);
    RecordingService(BuildContext context) {
      _timer = RestartableTimer(_timerInterval, _addCurrentLocation);

      _routeList = context.read<RouteList>();
    }
    // ignore: unused_field
    late final RestartableTimer _timer;
    get isRecordingActive => _timer.isActive;

    void _stopTimer() {
      _timer.cancel();
    }

    // periodically runs the timer to register the locations
    void _startTimer() {
      _timer.reset();
    }

    void pauseRecording() {
      _stopTimer();
    }

    // saves the current recording and starts another one
    void startRecording() {
      // stop recording before starting a new one
      stopRecording();
      _routeList.add(_currentRecording);
      _startTimer();
    }

    // saves the recording and stop it afterwards
    void stopRecording() {
      _stopTimer();
      _clearCurrentRecording();
    }

    @override
    void dispose() {
      stopRecording();
    }
}