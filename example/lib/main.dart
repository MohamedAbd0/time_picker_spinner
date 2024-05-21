import 'package:flutter/material.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      locale: const Locale('ar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("time_picker_spinner"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${dateTime.hour} : ${dateTime.minute}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Divider(),
            TimePickerSpinner(
              locale: const Locale('en', ''),
              time: dateTime,
              is24HourMode: false,
              isShowSeconds: false,
              itemHeight: 80,
              normalTextStyle: const TextStyle(
                fontSize: 24,
              ),
              highlightedTextStyle:
                  const TextStyle(fontSize: 24, color: Colors.blue),
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  dateTime = time;
                });
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
