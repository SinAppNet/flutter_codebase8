import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'match_page_widget.dart' show MatchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class MatchPageModel extends FlutterFlowModel<MatchPageWidget> {
  ///  Local state fields for this page.

  bool tutorial = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  Stream<List<UsuariosSemConexoesRow>>? swipeableStackSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in SwipeableStack widget.
  List<UsersRow>? usre;
  // Stores action output result for [Backend Call - API (send push)] action in SwipeableStack widget.
  ApiCallResponse? apiResultnx6;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
