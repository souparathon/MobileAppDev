import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Stateful Widget',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // A widget that will be started on the application startup
      home: CounterImage(),
    );
  }
}

class CounterImage extends StatefulWidget {
  @override
  _CounterImageState createState() => _CounterImageState();
}

class _CounterImageState extends State<CounterImage> {
//initial counter value
  int _counter = 0;
  bool _isFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter and Image Toggle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter: $_counter',
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
            ),
            SizedBox(height: 40),
            _isFirstImage
                ? Image.asset('assets/image1.png', width: 200, height: 200)
                : Image.asset('assets/image2.png', width: 200, height: 200),
            ElevatedButton(
              onPressed: _toggleImage,
              child: Text('Toggle Image'),
            ),
          ],
        ),
      ),
    );
  }
}
