import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/user_profile_card/user_profile_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'match_page_model.dart';
export 'match_page_model.dart';

class MatchPageWidget extends StatefulWidget {
  const MatchPageWidget({
    super.key,
    bool? fromSignin,
  }) : fromSignin = fromSignin ?? false;

  final bool fromSignin;

  @override
  State<MatchPageWidget> createState() => _MatchPageWidgetState();
}

class _MatchPageWidgetState extends State<MatchPageWidget>
    with TickerProviderStateMixin {
  late MatchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -81.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            StreamBuilder<List<UsuariosSemConexoesRow>>(
              stream: _model.swipeableStackSupabaseStream ??= SupaFlow.client
                  .from("usuarios_sem_conexoes")
                  .stream(primaryKey: ['id'])
                  .neqOrNull(
                    'profile_pic',
                    '',
                  )
                  .order('destaque')
                  .map((list) => list
                      .map((item) => UsuariosSemConexoesRow(item))
                      .toList()),
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
                List<UsuariosSemConexoesRow>
                    swipeableStackUsuariosSemConexoesRowList = snapshot.data!;

                if (swipeableStackUsuariosSemConexoesRowList.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/thumbs-up.png',
                    ),
                  );
                }

                return FlutterFlowSwipeableStack(
                  onSwipeFn: (index) {},
                  onLeftSwipe: (index) {},
                  onRightSwipe: (index) async {
                    final swipeableStackUsuariosSemConexoesRow =
                        swipeableStackUsuariosSemConexoesRowList[index];
                    await ConexaoTable().insert({
                      'solicitou': FFAppState().currentUser.id,
                      'solicitado':
                          swipeableStackUsuariosSemConexoesRowList[index].id,
                      'status': StatusConexao.solicitada.name,
                    });
                    _model.usre = await UsersTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'id',
                        swipeableStackUsuariosSemConexoesRowList[index].id,
                      ),
                    );
                    _model.apiResultnx6 = await SendPushCall.call(
                      fcmToken: _model.usre?.firstOrNull?.fcmToken,
                      pushTitle: 'Solicitação de conexão',
                      pushMessage:
                          '${FFAppState().currentUser.nome} quer fazer uma conexão com você!',
                    );

                    safeSetState(() {});
                  },
                  onUpSwipe: (index) {},
                  onDownSwipe: (index) {},
                  itemBuilder: (context, swipeableStackIndex) {
                    final swipeableStackUsuariosSemConexoesRow =
                        swipeableStackUsuariosSemConexoesRowList[
                            swipeableStackIndex];
                    return UserProfileCardWidget(
                      key: Key(
                          'Key1gc_${swipeableStackIndex}_of_${swipeableStackUsuariosSemConexoesRowList.length}'),
                      user: swipeableStackUsuariosSemConexoesRow,
                      fromSignin: widget.fromSignin,
                      action: (side) async {
                        if (side == 'left') {
                          _model.swipeableStackController.swipeLeft();
                        } else {
                          _model.swipeableStackController.swipeRight();
                        }
                      },
                    );
                  },
                  itemCount: swipeableStackUsuariosSemConexoesRowList.length,
                  controller: _model.swipeableStackController,
                  loop: true,
                  cardDisplayCount: 2,
                  scale: 1.0,
                  cardPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                );
              },
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 212.0),
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
                        _model.swipeableStackController.swipeLeft();
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
                        _model.swipeableStackController.swipeRight();
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (_model.tutorial == true)
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Color(0x9E000000),
                ),
              ),
            if (_model.tutorial == true)
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 257.0,
                      decoration: BoxDecoration(
                        color: const Color(0x00FFFFFF),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/conecter-c9b68m/assets/rssttbz0ximz/Rectangle_30.png',
                          ).image,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                    LinearPercentIndicator(
                      percent: 1.0,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      lineHeight: 12.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: const Color(0xFF009C3B),
                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                      padding: EdgeInsets.zero,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 24.0, 150.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Direita',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF00FF60),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Conectar com o \nperfil',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: const Color(0x00FFFFFF),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/f2ce6a8b7dcf5b86f78d4e700c18e092.gif',
                                  ).image,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 0.0, 150.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Esquerda',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFFF0000),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Ver o próximo \nperfil',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: const Color(0x00FFFFFF),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/cde1bd89c473aa7ed957bf4afc72d123.gif',
                                  ).image,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 300.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.tutorial = false;
                            safeSetState(() {});
                          },
                          text: 'Entendi',
                          icon: const Icon(
                            Icons.check_circle_sharp,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF009C3B),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
