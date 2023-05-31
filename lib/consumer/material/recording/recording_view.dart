import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routes_app/server/recording.dart';

class MaterialRecordingView extends StatelessWidget {
  const MaterialRecordingView({super.key});

  @override
  Widget build(BuildContext context) {
    var recordingService = context.read<RecordingService>();
    return Text(recordingService.isRecordingActive ? "ACTIVE" : "STOPPED");
  }
}