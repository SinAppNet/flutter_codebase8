// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:app_links_web/app_links_web.dart';
import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:device_info_plus/src/device_info_plus_web.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:permission_handler_html/permission_handler_html.dart';
import 'package:pointer_interceptor_web/pointer_interceptor_web.dart';
import 'package:record_web/record_web.dart';
import 'package:share_plus/src/share_plus_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:sign_in_with_apple_web/sign_in_with_apple_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:youtube_player_iframe_web/src/web_youtube_player_iframe_platform.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AppLinksPluginWeb.registerWith(registrar);
  AssetsAudioPlayerWebPlugin.registerWith(registrar);
  DeviceInfoPlusWebPlugin.registerWith(registrar);
  FilePickerWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  FlutterSecureStorageWeb.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  WebPermissionHandler.registerWith(registrar);
  PointerInterceptorWeb.registerWith(registrar);
  RecordPluginWeb.registerWith(registrar);
  SharePlusWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  SignInWithApplePlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  VideoPlayerPlugin.registerWith(registrar);
  WebYoutubePlayerIframePlatform.registerWith(registrar);
  registrar.registerMessageHandler();
}
