import '/backend/supabase/supabase.dart';
import '/componentes/current_user_profile/current_user_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    bool? back,
  }) : back = back ?? false;

  final bool back;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());

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

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.back == false)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu_sharp,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          if (widget.back == true)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.back == false)
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Share.share(
                        'lp.sinapp.online',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.share,
                      color: Colors.white,
                      size: 32.0,
                    ),
                  ),
                ),
              SizedBox(
                width: 42.0,
                height: 42.0,
                child: Stack(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.getEmpresa = await EmpresasTable().queryRows(
                          queryFn: (q) => q.eq(
                            'id',
                            FFAppState().currentUser.empresaId,
                          ),
                        );
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.95,
                                  child: CurrentUserProfileWidget(
                                    empresa: _model.getEmpresa?.first,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        safeSetState(() {});
                      },
                      child: Container(
                        width: 42.0,
                        height: 42.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 500),
                          fadeOutDuration: const Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            FFAppState().currentUser.profilePic,
                            'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(width: 12.0)),
          ),
        ],
      ),
    );
  }
}
