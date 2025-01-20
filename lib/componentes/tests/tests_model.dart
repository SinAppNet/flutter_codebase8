import '/flutter_flow/flutter_flow_util.dart';
import 'tests_widget.dart' show TestsWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class TestsModel extends FlutterFlowModel<TestsWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  String? audioPath;

  ///  State fields for stateful widgets in this page.

  AudioRecorder? audioRecorder;
  String? stopped;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
