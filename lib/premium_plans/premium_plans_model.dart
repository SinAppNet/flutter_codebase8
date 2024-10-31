import '/componentes/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'premium_plans_widget.dart' show PremiumPlansWidget;
import 'package:flutter/material.dart';

class PremiumPlansModel extends FlutterFlowModel<PremiumPlansWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
  }
}
