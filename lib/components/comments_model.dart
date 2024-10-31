import '/backend/supabase/supabase.dart';
import '/components/write_commen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_widget.dart' show CommentsWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommentsModel extends FlutterFlowModel<CommentsWidget> {
  ///  Local state fields for this component.

  List<int> mock = [1, 2, 3, 4];
  void addToMock(int item) => mock.add(item);
  void removeFromMock(int item) => mock.remove(item);
  void removeAtIndexFromMock(int index) => mock.removeAt(index);
  void insertAtIndexInMock(int index, int item) => mock.insert(index, item);
  void updateMockAtIndex(int index, Function(int) updateFn) =>
      mock[index] = updateFn(mock[index]);

  ///  State fields for stateful widgets in this component.

  Completer<List<FeedComentariosRow>>? requestCompleter;
  // Model for writeCommen component.
  late WriteCommenModel writeCommenModel;

  @override
  void initState(BuildContext context) {
    writeCommenModel = createModel(context, () => WriteCommenModel());
  }

  @override
  void dispose() {
    writeCommenModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
