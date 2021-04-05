//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterproject_v3/ui/auth/auth.dart';
//import 'package:waterproject_v3/ui/auth/auth.dart';

import 'package:waterproject_v3/ui/ui.dart';
import 'package:waterproject_v3/services/services.dart';
import 'package:waterproject_v3/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider<AuthService>(
        create: (context) => AuthService(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
          builder: (_, themeProviderRef, __) {
            return AuthWidgetBuilder(
              builder: (BuildContext context,
                  AsyncSnapshot<FirebaseUser> userSnapshot) {
                return MaterialApp(
                  locale: languageProviderRef.getLocale, 
                  localizationsDelegates: [
                    const AppLocalizationsDelegate(), 
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.languages.keys
                      .toList(), 
                  navigatorObservers: [
                    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
                  ],
                  debugShowCheckedModeBanner: false,
                  routes: Routes.routes,
                  theme: AppThemes.lightTheme,
                  darkTheme: AppThemes.darkTheme,
                  themeMode: themeProviderRef.isDarkModeOn
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home:
                      (userSnapshot?.data?.uid != null) ? HomeUI() : SignInUI(),
                );
              },
            );
          },
        );
      },
}
