import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'teste09_model.dart';
export 'teste09_model.dart';

class Teste09Widget extends StatefulWidget {
  const Teste09Widget({super.key});

  @override
  State<Teste09Widget> createState() => _Teste09WidgetState();
}

class _Teste09WidgetState extends State<Teste09Widget> {
  late Teste09Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Teste09Model());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<UsuariosSemConexoesRow>>(
                  stream: _model.listViewSupabaseStream ??= SupaFlow.client
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
                        listViewUsuariosSemConexoesRowList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUsuariosSemConexoesRowList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewUsuariosSemConexoesRow =
                            listViewUsuariosSemConexoesRowList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 18.0, 0.0),
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      listViewUsuariosSemConexoesRow.profilePic,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/conecter-c9b68m/assets/20e3xofx7sel/sinapplogo_converted-removebg-preview.png',
                                    ),
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    listViewUsuariosSemConexoesRow.nome,
                                    'name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
