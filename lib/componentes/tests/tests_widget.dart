import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'tests_model.dart';
export 'tests_model.dart';

class TestsWidget extends StatefulWidget {
  const TestsWidget({super.key});

  @override
  State<TestsWidget> createState() => _TestsWidgetState();
}

class _TestsWidgetState extends State<TestsWidget> {
  late TestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestsModel());

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.audioPath != null && _model.audioPath != '')
                    FlutterFlowAudioPlayer(
                      audio: Audio.network(
                        _model.audioPath!,
                        metas: Metas(
                          title: 'Gabriel Meneses',
                        ),
                      ),
                      titleTextStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'Inter',
                                fontSize: 0.0,
                                letterSpacing: 0.0,
                              ),
                      playbackDurationTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      playbackButtonColor: const Color(0xFF009C3B),
                      activeTrackColor: const Color(0xFF009C3B),
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).alternate,
                      elevation: 0.0,
                      playInBackground: PlayInBackground.enabled,
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.audioPath == null || _model.audioPath == '')
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!_model.isRecording)
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.isRecording = true;
                                    safeSetState(() {});
                                    await startAudioRecording(
                                      context,
                                      audioRecorder: _model.audioRecorder ??=
                                          AudioRecorder(),
                                    );
                                  },
                                  text: 'Record',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              if (_model.isRecording)
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.isRecording = false;
                                    safeSetState(() {});
                                    await stopAudioRecording(
                                      audioRecorder: _model.audioRecorder,
                                      audioName: 'recordedFileBytes',
                                      onRecordingComplete:
                                          (audioFilePath, audioBytes) {
                                        _model.stopped = audioFilePath;
                                        _model.recordedFileBytes = audioBytes;
                                      },
                                    );

                                    _model.audioPath = _model.stopped;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: 'Stop',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).warning,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                            ].divide(const SizedBox(width: 18.0)),
                          ),
                        if (_model.audioPath != null && _model.audioPath != '')
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.audioPath = null;
                                  safeSetState(() {});
                                },
                                text: 'Delete',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(const SizedBox(width: 18.0)),
                          ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
