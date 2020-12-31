import 'package:flutter/material.dart';
import 'package:flutter_app_estudo/snackbar/second_page.dart';

import 'global_scaffold.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scafoldKey,
          body: child,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (_) => MyHomePage(title: 'Flutter Demo snackbar global'),
        '/second': (_) => SecondPage(title: 'Segunda página')
      },
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

  void onClickSnackbarGlobal() {
    final snackbar = SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 150.0,
        content: Text("Eu sou um Snackbar Global!"));
    GlobalScaffold.instance.showSnackbar(snackbar);
  }

  void onClickSnackbarLocal() {
    final snackbar = SnackBar(content: Text("Eu sou um Snackbar Local!"));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          RaisedButton(
              child: Text('Ir para segunda página'),
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              }),
          RaisedButton(
            child: Text('Mostrar Sanackbar Global'),
            onPressed: () => onClickSnackbarGlobal(),
          )
        ],
      ),
    );
  }
}
