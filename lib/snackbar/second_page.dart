import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
            child: Text('Voltar'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      )
    );
  }
}
