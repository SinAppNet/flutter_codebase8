import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'icons_model.dart';
export 'icons_model.dart';

class IconsWidget extends StatefulWidget {
  const IconsWidget({super.key});

  @override
  State<IconsWidget> createState() => _IconsWidgetState();
}

class _IconsWidgetState extends State<IconsWidget> {
  late IconsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FFIcons.kcasinha2,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.kadduser,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.kpresente,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.ksalvavida,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.ksair,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.kplayer,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.kusercirculo,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.klikefill,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Icon(
                  FFIcons.klikeoutl,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
