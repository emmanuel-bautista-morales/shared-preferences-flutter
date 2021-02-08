import 'package:flutter/material.dart';
import 'package:preferencas_usuario/share_prefs/preferencias_usuario.dart';
import 'package:preferencas_usuario/src/widgets/drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
        ),
        drawer: DrawerMenu(),
        body: ListView(
          children: [
            Container(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(5),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Modo oscuro'),
              onChanged: (value) {
                setState(() {
                  prefs.colorSecundario = value;
                  _colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del usuario perrón',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {},
                ))
          ],
        ));
  }
}
