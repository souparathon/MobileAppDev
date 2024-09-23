import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Stateful Widget',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
//initial couter value
  int _counter = 0;
  int _incrementValue=1; //
  List<int> _log=[]; //holds a log of button actions

  void _incrementCounter() { //only when using increment button will message show
    setState(() {
      if (_counter + _incrementValue <= 100) {
        _log.add(_counter);
        _counter += _incrementValue;
        if (_counter == 100) {
          _showMessage('Maximum limit reached!');
        } else if(_counter ==42){
          _showMessage('What is the meaning of life?');
        }
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) { //if it's greater than zero, can still decrement
        _log.add(_counter); //adds a message to the log
        _counter--;
        if (_counter == 42) {
          _showMessage('What is the meaning of life?');
      }
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _log.add(_counter);
      _counter = 0;
      _showMessage('Counter has been reset!!!!!!!!!!!!!!!!!!!!!!!!!');
    });
  }

  void _undo() {
    setState(() {
      if (_log.isNotEmpty) {
        _counter = _log.removeLast();
        _showMessage('Undo!');
      }
    });
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),

      backgroundColor:_counter >= 0 && _counter <=20
        ? Colors.red
        : _counter >= 21 && _counter <= 40
          ? Colors.orange
          : _counter >= 41 && _counter <= 60
            ? Colors.yellow
            : _counter >= 61 && _counter <= 80
              ? Colors.green
              : Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _counter==0
              ? Colors.red
              : _counter>20
                ? Colors.green
                : Colors.blue,

              // Rainbow version
              //color: _counter >= 0 && _counter <= 20
              //? Colors.red
              //: _counter >= 21 && _counter <= 40
                //? Colors.orange
                //: _counter >= 41 && _counter <= 60
                  //? Colors.yellow
                  //: _counter >= 61 && _counter <= 80
                    //? Colors.green
                    //: Colors.blue,
              child: Text(
                //displays the current number
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.pink,
            inactiveColor: Colors.purple,
          ),

          //
          TextField(
            decoration: InputDecoration(labelText: 'Increment Value'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _incrementValue = int.tryParse(value) ?? 1;
              });
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: _resetCounter,
                child: Text('Reset'),
              ),
              ElevatedButton(
                onPressed: _undo,
                child: Text('Undo'),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _log.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Previous value: ${_log[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
