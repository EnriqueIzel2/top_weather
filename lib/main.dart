import 'package:flutter/material.dart';

import 'data_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Top Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "cityName",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              '°',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                controller: _cityTextController,
                decoration: InputDecoration(labelText: 'Cidade'),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              child: Text("Buscar"),
            )
          ],
        ),
      ),
    );
  }

  void _search() {
    _dataService.getWeather(_cityTextController.text);
  }
}
