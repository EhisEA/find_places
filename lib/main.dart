import 'package:flutter/material.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/flutter_animated_theme.dart';
import 'package:find_places/constants/thema_data.dart';
import 'package:find_places/services/geolocator_services.dart';
import 'package:find_places/services/theme_service.dart';
import 'package:find_places/views/alt_home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeService>(
      create: (context) => ThemeService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => GeolocationServices().getLocation(),
        ),
      ],
      child: Consumer<ThemeService>(
        builder: (_, model, __) {
          return AnimatedThemeApp(
              title: "Find Places",
              debugShowCheckedModeBanner: false,
              themeMode: model.isDark ? ThemeMode.dark : ThemeMode.light??ThemeMode.light,
              animationDuration: Duration(milliseconds: 500),
              animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
              theme: myLightTheme,
              darkTheme: myDarkTheme,
              home: AltHomeView());
        },
      ),
    );
  }
}
