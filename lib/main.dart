import 'package:flutter/material.dart';
import 'package:preferencas_usuario/share_prefs/preferencias_usuario.dart';
import 'package:preferencas_usuario/src/pages/home_page.dart';
import 'package:preferencas_usuario/src/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

// WidgetsFlutterBinding.ensureInitialized();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias de usuario',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage()
      },
    );
  }
}
