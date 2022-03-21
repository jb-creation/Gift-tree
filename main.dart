import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/utils/bloc_observer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/res/colors.dart';

import 'app.dart';
import 'pref/app_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColor.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarContrastEnforced: true,
    systemStatusBarContrastEnforced: true,
  ));
  // await Firebase.initializeApp();
  await   AppPref.init();
  await ApiClient.init();
  EquatableConfig.stringify = true;
  Bloc.observer = MyBlocObserver();
  runApp(const PessaFlowApp());
}
