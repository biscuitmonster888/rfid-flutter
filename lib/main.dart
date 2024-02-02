import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rfid/seat_page.dart';
import 'package:sunmi_uhf/sunmi_uhf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' RIFD Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _result = 'Unknown';
  bool _isConnected = false;
  init() async {
    _isConnected = await SunmiUhf.init();
    if(_isConnected){
      SunmiUhf.onUhfScanned().listen((event) {
        if(event != null) {
          _result = event;
          setState(() {});
        }

      });
    }

  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    SunmiUhf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sunmi uhf'),
        ),
        body: Center(
          child:
          ElevatedButton(onPressed: () async {
            _isConnected = await SunmiUhf.init();
            if(_isConnected){
              //Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SeatPage())
              );

              return;

              SunmiUhf.onUhfScanned().listen((event) {
                if(event != null) {
                  _result = event;
                  setState(() {});
                }

              });
            }
            setState(() {});
          }, child: const Text('Connect RFID Device'))
        ),
      ),
    );
  }
}
