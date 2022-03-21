import 'dart:async';

import 'package:pessa_flow/res/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/route.dart';
import 'extensions/extension.dart';
import 'generated/l10n.dart';
import 'utils/connectivity_utils.dart';

class PessaFlowApp extends StatefulWidget {
  const PessaFlowApp({Key? key}) : super(key: key);

  @override
  _PessaFlowAppState createState() => _PessaFlowAppState();
}

class _PessaFlowAppState extends State<PessaFlowApp> with WidgetsBindingObserver {
  final List<StreamSubscription> _listStreamSubscriptions = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    ConnectivityUtils.instance.init();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.addObserver(this);
    ConnectivityUtils.instance.dispose();
    // FirebaseUtils.instance.dispose();
    for (var subscription in _listStreamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALS Transfer',
      debugShowCheckedModeBanner: false,
      navigatorKey: App.navigatorKey,
      navigatorObservers: [App.routeObserver],
      theme: AppTheme.theme,
      routes: AppRoute.listRoutes,
      builder: (context, child) {
        var size = context.mediaQuery.size;
        var systemTextScale = context.mediaQuery.textScaleFactor;
        var textScaleFactor = 1.0;
        if (size.width < 320) {
          textScaleFactor = 0.9;
        } else if (size.width > 440) {
          textScaleFactor = 1.2;
        } else {
          textScaleFactor = 1.0;
        }
        return MediaQuery(
          data: context.mediaQuery.copyWith(textScaleFactor: textScaleFactor * systemTextScale),
          child: child ?? const SizedBox.shrink(),
        );
      },
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
