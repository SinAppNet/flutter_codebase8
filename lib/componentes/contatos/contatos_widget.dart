import '/backend/supabase/supabase.dart';
import '/componentes/empty/empty_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contatos_model.dart';
export 'contatos_model.dart';

class ContatosWidget extends StatefulWidget {
  const ContatosWidget({super.key});

  @override
  State<ContatosWidget> createState() => _ContatosWidgetState();
}

class _ContatosWidgetState extends State<ContatosWidget> {
  late ContatosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContatosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Container(
                  width: 65.0,
                  height: 5.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE2E2E2),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                    child: FutureBuilder<List<ConexoesAceitasRow>>(
                      future: ConexoesAceitasTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              height: double.infinity,
                              child: EmptyWidget(),
                            ),
                          );
                        }
                        List<ConexoesAceitasRow> columnConexoesAceitasRowList =
                            snapshot.data!;

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnConexoesAceitasRowList.length,
                                (columnIndex) {
                              final columnConexoesAceitasRow =
                                  columnConexoesAceitasRowList[columnIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 62.0,
                                          height: 62.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x00ECECEC),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  columnConexoesAceitasRow
                                                      .profilePic,
                                                  'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                                ),
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(200.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  columnConexoesAceitasRow.nome,
                                                  'Username',
                                                ).maybeHandleOverflow(
                                                  maxChars: 18,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF101828),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    columnConexoesAceitasRow
                                                        .cargo,
                                                    'Cargo',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 15,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6941C6),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    columnConexoesAceitasRow
                                                        .empresaNome,
                                                    'Empresa',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 20,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF101828),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: const Color(0xFF009C3B),
                                          icon: const Icon(
                                            Icons.chat_bubble_outline_sharp,
                                            color: Colors.white,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            _model.chat =
                                                await ChatTable().queryRows(
                                              queryFn: (q) => q
                                                  .contains(
                                                    'users',
                                                    '{${columnConexoesAceitasRow.id}}',
                                                  )
                                                  .contains(
                                                    'users',
                                                    '{${FFAppState().currentUser.id}}',
                                                  ),
                                            );

                                            context.pushNamed(
                                              'chat',
                                              queryParameters: {
                                                'chat': serializeParam(
                                                  _model.chat?.first,
                                                  ParamType.SupabaseRow,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );

                                            safeSetState(() {});
                                          },
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
