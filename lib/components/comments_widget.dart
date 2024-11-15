import '/backend/supabase/supabase.dart';
import '/componentes/empty/empty_widget.dart';
import '/components/commen_widget.dart';
import '/components/write_commen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'comments_model.dart';
export 'comments_model.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    this.post,
  });

  final FeedPostagensRow? post;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  late CommentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 14.0),
            child: Container(
              width: 65.0,
              height: 5.0,
              decoration: const BoxDecoration(
                color: Color(0xFFE2E2E2),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<FeedComentariosRow>>(
              future: (_model.requestCompleter ??=
                      Completer<List<FeedComentariosRow>>()
                        ..complete(FeedComentariosTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'onPost',
                                true,
                              )
                              .eq(
                                'post',
                                widget.post!.id,
                              ),
                        )))
                  .future,
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return const Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitPulse(
                        color: Color(0xFF009C3B),
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<FeedComentariosRow> listViewFeedComentariosRowList =
                    snapshot.data!;

                if (listViewFeedComentariosRowList.isEmpty) {
                  return const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: EmptyWidget(),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    24.0,
                    0,
                    0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewFeedComentariosRowList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewFeedComentariosRow =
                        listViewFeedComentariosRowList[listViewIndex];
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: CommenWidget(
                        key: Key(
                            'Keyz8s_${listViewIndex}_of_${listViewFeedComentariosRowList.length}'),
                        comment: listViewFeedComentariosRow,
                        callback: () async {
                          safeSetState(() => _model.requestCompleter = null);
                          await _model.waitForRequestCompleted();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          wrapWithModel(
            model: _model.writeCommenModel,
            updateCallback: () => safeSetState(() {}),
            child: WriteCommenWidget(
              post: widget.post,
              callback: () async {
                safeSetState(() => _model.requestCompleter = null);
                await _model.waitForRequestCompleted();
              },
            ),
          ),
        ],
      ),
    );
  }
}
