import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'user_profile_card_model.dart';
export 'user_profile_card_model.dart';

class UserProfileCardWidget extends StatefulWidget {
  const UserProfileCardWidget({
    super.key,
    this.user,
    required this.action,
    bool? fromSignin,
  }) : fromSignin = fromSignin ?? false;

  final UsuariosSemConexoesRow? user;
  final Future Function(String side)? action;
  final bool fromSignin;

  @override
  State<UserProfileCardWidget> createState() => _UserProfileCardWidgetState();
}

class _UserProfileCardWidgetState extends State<UserProfileCardWidget> {
  late UserProfileCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onDoubleTap: () async {
        _model.usr = await UsersTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.user?.id,
          ),
        );

        context.pushNamed(
          'userProfile',
          queryParameters: {
            'user': serializeParam(
              _model.usr?.firstOrNull,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Stack(
          children: [
            Hero(
              tag: widget.user!.profilePic!,
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  widget.user!.profilePic!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 483.0,
                decoration: BoxDecoration(
                  color: const Color(0x00FFFFFF),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/conecter-c9b68m/assets/bl8if4m9vw7i/Rectangle_1.png',
                    ).image,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 200.0,
                                  buttonSize: 100.0,
                                  fillColor: const Color(0x66EF3939),
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Color(0xFFFF0000),
                                    size: 42.0,
                                  ),
                                  onPressed: () async {
                                    await widget.action?.call(
                                      'left',
                                    );
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 200.0,
                                  buttonSize: 100.0,
                                  fillColor: const Color(0x67009C3B),
                                  icon: const Icon(
                                    FFIcons.klikeoutl,
                                    color: Color(0xFF009C3B),
                                    size: 42.0,
                                  ),
                                  onPressed: () async {
                                    await widget.action?.call(
                                      'right',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        Text(
                          valueOrDefault<String>(
                            widget.user?.nome,
                            'Nome usuário',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.user?.sobre,
                            'Descrição',
                          ).maybeHandleOverflow(
                            maxChars: 70,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 18.0, 0.0, 38.0),
                        child: FutureBuilder<List<EmpresasRow>>(
                          future: EmpresasTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget.user?.empresa,
                            ),
                          ),
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
                            List<EmpresasRow> rowEmpresasRowList =
                                snapshot.data!;

                            final rowEmpresasRow = rowEmpresasRowList.isNotEmpty
                                ? rowEmpresasRowList.first
                                : null;

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 62.0,
                                  height: 62.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      rowEmpresasRow?.logoPic,
                                      'https://zzkdkcmagsfmryaijywn.supabase.co/storage/v1/object/public/users/empresa/images.jpeg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                rowEmpresasRow?.nome,
                                                'Nome empresa',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: ' - ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                rowEmpresasRow?.segmento,
                                                'Segmento',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    Text(
                                      valueOrDefault<String>(
                                        rowEmpresasRow?.nome,
                                        'Nome da empresa',
                                      ).maybeHandleOverflow(
                                        maxChars: 25,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  rowEmpresasRow?.address,
                                                  r'''$.cidade''',
                                                )?.toString(),
                                                'Cidade',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFFD3D3D3),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const TextSpan(
                                              text: ' - ',
                                              style: TextStyle(
                                                color: Color(0xFFD3D3D3),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  rowEmpresasRow?.address,
                                                  r'''$.estado''',
                                                )?.toString(),
                                                'Estado',
                                              ),
                                              style: const TextStyle(
                                                color: Color(0xFFD3D3D3),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 5.0)),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 18.0, 12.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 200.0,
                          buttonSize: 82.0,
                          fillColor: const Color(0x69FFFFFF),
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: FlutterFlowTheme.of(context).info,
                            size: 32.0,
                          ),
                          onPressed: () async {
                            _model.usrCopy = await UsersTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                widget.user?.id,
                              ),
                            );

                            context.pushNamed(
                              'userProfile',
                              queryParameters: {
                                'user': serializeParam(
                                  _model.usrCopy?.firstOrNull,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            safeSetState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                buttonSize: 52.0,
                fillColor: const Color(0xFF009C3B),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 32.0,
                ),
                onPressed: () async {
                  if (widget.fromSignin == true) {
                    context.pushNamed('newHome');
                  } else {
                    context.safePop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
