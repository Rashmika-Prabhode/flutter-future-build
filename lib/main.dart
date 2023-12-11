import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future Builder'),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder<String>(
          future: yourAsyncFunction(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text('Awaiting result...');
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }

  Future<String> yourAsyncFunction() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello, FutureBuilder!';
  }
}
