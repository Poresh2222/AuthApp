//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject_v3/ui/auth/auth.dart';

import 'package:waterproject_v3/ui/ui.dart';
import 'package:waterproject_v3/services/services.dart';
import 'package:waterproject_v3/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (_, themeProviderRef, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode:
            themeProviderRef.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        home:
            SettingsUI(), //(userSnapshot?.data?.uid != null) ? HomeUI() : SignInUI(),
      );
    });
  }
}
