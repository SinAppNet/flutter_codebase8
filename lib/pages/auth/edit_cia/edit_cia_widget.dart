import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_cia_model.dart';
export 'edit_cia_model.dart';

class EditCiaWidget extends StatefulWidget {
  const EditCiaWidget({super.key});

  @override
  State<EditCiaWidget> createState() => _EditCiaWidgetState();
}

class _EditCiaWidgetState extends State<EditCiaWidget> {
  late EditCiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCiaModel());

    _model.nomeEmpresaFocusNode ??= FocusNode();

    _model.cnpjEmpresaFocusNode ??= FocusNode();

    _model.cidadeEmpresaFocusNode ??= FocusNode();

    _model.faturamentoAnualFocusNode ??= FocusNode();

    _model.qntdColaboradoresFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<EmpresasRow>>(
            future: EmpresasTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                FFAppState().currentUser.empresaId,
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
              List<EmpresasRow> containerEmpresasRowList = snapshot.data!;

              final containerEmpresasRow = containerEmpresasRowList.isNotEmpty
                  ? containerEmpresasRowList.first
                  : null;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 32.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120.0,
                              height: 120.0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 120.0,
                                    height: 120.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        containerEmpresasRow?.logoPic,
                                        'https://zzkdkcmagsfmryaijywn.supabase.co/storage/v1/object/public/users/empresa/images.jpeg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          storageFolderPath: 'empresa',
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls =
                                                await uploadSupabaseStorageFiles(
                                              bucketName: 'users',
                                              selectedFiles: selectedMedia,
                                            );
                                          } finally {
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        await EmpresasTable().update(
                                          data: {
                                            'logo_pic': _model.uploadedFileUrl,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            FFAppState().currentUser.empresaId,
                                          ),
                                        );
                                        _model.change = true;
                                        safeSetState(() {});
                                      },
                                      text: 'Editar',
                                      options: FFButtonOptions(
                                        height: 32.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF009C3B),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nome da empresa',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFF344054),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.nomeEmpresaTextController ??=
                                              TextEditingController(
                                        text: containerEmpresasRow?.nome,
                                      ),
                                      focusNode: _model.nomeEmpresaFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.nomeEmpresaTextController',
                                        const Duration(milliseconds: 0),
                                        () async {
                                          _model.change = true;
                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Sua empresa',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF667085),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD0D5DD),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xB1009C3B),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                15.0, 20.0, 15.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF667085),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .nomeEmpresaTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CNPJ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF344054),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.cnpjEmpresaTextController ??=
                                            TextEditingController(
                                      text: containerEmpresasRow?.cnpj,
                                    ),
                                    focusNode: _model.cnpjEmpresaFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.cnpjEmpresaTextController',
                                      const Duration(milliseconds: 0),
                                      () async {
                                        _model.change = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'CNPJ da empresa',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF667085),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD0D5DD),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xB1009C3B),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15.0, 20.0, 15.0, 20.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFF667085),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .cnpjEmpresaTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.cnpjEmpresaMask],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cidade',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF344054),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller: _model
                                                  .cidadeEmpresaTextController ??=
                                              TextEditingController(
                                            text: getJsonField(
                                              containerEmpresasRow?.address,
                                              r'''$.cidade''',
                                            ).toString(),
                                          ),
                                          focusNode:
                                              _model.cidadeEmpresaFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.cidadeEmpresaTextController',
                                            const Duration(milliseconds: 0),
                                            () async {
                                              _model.change = true;
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Cidade',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: const Color(0xFF667085),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFD0D5DD),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xB1009C3B),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 20.0, 15.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: const Color(0xFF667085),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .cidadeEmpresaTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Estado',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF344054),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      FlutterFlowDropDown<String>(
                                        controller: _model
                                                .estadoEmpresaValueController ??=
                                            FormFieldController<String>(
                                          _model.estadoEmpresaValue ??=
                                              getJsonField(
                                            containerEmpresasRow?.address,
                                            r'''$.estado''',
                                          ).toString(),
                                        ),
                                        options: const [
                                          'AC',
                                          'AL',
                                          'AP',
                                          'AM',
                                          'BA',
                                          'CE',
                                          'DF',
                                          'ES',
                                          'GO',
                                          'MA',
                                          'MT',
                                          'MS',
                                          'MG',
                                          'PA',
                                          'PB',
                                          'PR',
                                          'PE',
                                          'PI',
                                          'RJ',
                                          'RN',
                                          'RS',
                                          'RO',
                                          'RR',
                                          'SC',
                                          'SP',
                                          'SE',
                                          'TO'
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.estadoEmpresaValue = val);
                                          _model.change = true;
                                          safeSetState(() {});
                                        },
                                        width: double.infinity,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 0.0,
                                        borderColor: const Color(0xFFD0D5DD),
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 15.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Segmento',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF344054),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.segmentoEmpresaValueController ??=
                                          FormFieldController<String>(
                                    _model.segmentoEmpresaValue ??=
                                        containerEmpresasRow?.segmento,
                                  ),
                                  options: const [
                                    'Advocacia',
                                    'Agropecuaria',
                                    'Alementação e gastronomia',
                                    'Arquitetura',
                                    'Beleza e estética',
                                    'Comunicação visual',
                                    'Consultoria e Mentoria',
                                    'Construção Civil',
                                    'Contabilidade',
                                    'E-commerce',
                                    'Educação',
                                    'Energia sustentável',
                                    'Finanças',
                                    'Fitness',
                                    'Industria',
                                    'Investimentos',
                                    'Marketing',
                                    'Moda e vestuário',
                                    'SAAS',
                                    'Seguros',
                                    'Terapias holisticas',
                                    'TI',
                                    'Transportes',
                                    'Varejo',
                                    'Outros'
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.segmentoEmpresaValue = val);
                                    _model.change = true;
                                    safeSetState(() {});
                                  },
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Segmento',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0.0,
                                  borderColor: const Color(0xFFD0D5DD),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Faturamento anual',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFF344054),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                              .faturamentoAnualTextController ??=
                                          TextEditingController(
                                        text: containerEmpresasRow
                                            ?.faturamentoAtual
                                            ?.toString(),
                                      ),
                                      focusNode:
                                          _model.faturamentoAnualFocusNode,
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'R\$',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF667085),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD0D5DD),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xB1009C3B),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                15.0, 20.0, 15.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF667085),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: _model
                                          .faturamentoAnualTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Numero de colaboradores',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFF344054),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model
                                              .qntdColaboradoresTextController ??=
                                          TextEditingController(
                                        text: containerEmpresasRow
                                            ?.colaboradoresCount
                                            ?.toString(),
                                      ),
                                      focusNode:
                                          _model.qntdColaboradoresFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Quantidade de colaboradores',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: const Color(0xFF667085),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFD0D5DD),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xB1009C3B),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                15.0, 20.0, 15.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF667085),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: _model
                                          .qntdColaboradoresTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Porte da empresa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF344054),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.portesValueController ??=
                                      FormFieldController<String>(
                                    _model.portesValue ??=
                                        containerEmpresasRow?.porte,
                                  ),
                                  options: const [
                                    'ME (Micro empresa) - Faturamento bruto menor ou igual a 360 mil',
                                    'EPP ( Empresa de pequeno porte) - 360k a 4,8 milhões de faturamento bruto anual',
                                    'Média - Faturamento bruto anual maior que 4,8 milhões ou igual a 300 milhões',
                                    'Grande - Faturamento bruto anual maior que 300 milhões'
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.portesValue = val);
                                    _model.change = true;
                                    safeSetState(() {});
                                  },
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Portes',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0.0,
                                  borderColor: const Color(0xFFD0D5DD),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                            FFButtonWidget(
                              onPressed: (_model.change == false)
                                  ? null
                                  : () async {
                                      await EmpresasTable().update(
                                        data: {
                                          'nome': _model
                                              .nomeEmpresaTextController.text,
                                          'cnpj': _model
                                              .cnpjEmpresaTextController.text,
                                          'address': <String, dynamic>{
                                            'cidade': _model
                                                .cidadeEmpresaTextController
                                                .text,
                                            'estado': _model.estadoEmpresaValue,
                                          },
                                          'segmento':
                                              _model.segmentoEmpresaValue,
                                          'porte': _model.portesValue,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          containerEmpresasRow?.id,
                                        ),
                                      );
                                      await UsersTable().update(
                                        data: {
                                          'cidade_principal': _model
                                              .cidadeEmpresaTextController.text,
                                          'estado_principal':
                                              _model.estadoEmpresaValue,
                                          'segmento_empresa':
                                              _model.segmentoEmpresaValue,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'uuid',
                                          currentUserUid,
                                        ),
                                      );

                                      context.pushNamed('home');

                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('Perfil editado!'),
                                              content: const Text(
                                                  'Seu perfil foi editado com sucesso.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                              text: 'Salvar',
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                size: 18.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
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
                                disabledColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
