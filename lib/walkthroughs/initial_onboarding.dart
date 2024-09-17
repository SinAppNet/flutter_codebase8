import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/onb_text_widget.dart';

// Focus widget keys for this walkthrough
final textHrtyahqh = GlobalKey();
final columnRa8ig3k1 = GlobalKey();
final columnIufd2909 = GlobalKey();
final columnFiarvrix = GlobalKey();
final columnHcesus95 = GlobalKey();

/// Initial Onboarding
///
/// 8yusvd
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textHrtyahqh,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomCenter,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnbTextWidget(
              text: 'Procure e envie conexões para novos empreendedores.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnRa8ig3k1,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnbTextWidget(
              text: 'Gerencie as suas conexões por aqui.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: columnIufd2909,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnbTextWidget(
              text:
                  'Converse e marque reuniões com as suas conexões pelo chat.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: columnFiarvrix,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnbTextWidget(
              text: 'Deixe 100% preenchido o seu perfil e o da sua empresa.',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnHcesus95,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnbTextWidget(
              text: 'Veja suas notificações de notificação de conexão aqui.',
            ),
          ),
        ],
      ),
    ];
