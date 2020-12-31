import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  bool _ativo = false;
  final String _ativoVar = 'ativo3';

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    _initAppVerificaSeEstaAtivo();
    super.initState();
  }

  //todo fazer a mesma logica do app triagem. Redirecionar para tela de abertura e dps para modulo.
  //todo so que se a variavel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : Container(
                  child: _ativo
                      ? RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'Tela do Modulo',
                            style: TextStyle(fontSize: 50),
                          ),
                        )
                      : RaisedButton(
                          onPressed: () {
                            _setEstado();
                          },
                          child: Text(
                            'Tela inicial',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                )),
    );
  }

  _initAppVerificaSeEstaAtivo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ativo = prefs.getBool(_ativoVar) ?? false;

    print('Open $ativo.');

    setState(() {
      _ativo = ativo;
      _isLoading = false;
    });
  }

  _setEstado() async {
    setState(() {
      _isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ativo = prefs.getBool(_ativoVar) ?? false;
    print('Open1 $ativo.');

    if (!ativo){
      ativo = await prefs.setBool(_ativoVar, true);
    }

    print('Open2 $ativo.');
    setState(() {
      _ativo = ativo;
      _isLoading = false;
    });
  }

}
