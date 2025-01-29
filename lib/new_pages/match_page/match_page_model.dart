import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'match_page_widget.dart' show MatchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MatchPageModel extends FlutterFlowModel<MatchPageWidget> {
  ///  Local state fields for this page.

  bool tutorial = true;

  UsersRow? currentProfile;

  MatchTrackingRow? matchTrack;

  bool limitView = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in matchPage widget.
  List<MatchTrackingRow>? matchs;
  // Stores action output result for [Backend Call - Query Rows] action in matchPage widget.
  List<UsersRow>? user;
  // Stores action output result for [Backend Call - Insert Row] action in matchPage widget.
  MatchTrackingRow? matchg;
  // Stores action output result for [Backend Call - Insert Row] action in matchPage widget.
  MatchTrackingRow? matchgg;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  Stream<List<UsuariosSemConexoesRow>>? swipeableStackSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in SwipeableStack widget.
  List<MatchTrackingRow>? matchgh;
  Completer<List<MatchTrackingRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in SwipeableStack widget.
  List<MatchTrackingRow>? matchtg;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}

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
