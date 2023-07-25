import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 590,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Home Screen",
                        style:
                            TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.blue),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.green),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Dart_programming_language_logo.svg/2560px-Dart_programming_language_logo.svg.png',
                width: 200,
              ),
              Image.network(
                'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                width: 200,
              ),
              Image.network(
                'https://www.freepnglogos.com/uploads/android-logo-png/android-logo-transparent-png-svg-vector-2.png',
                width: 150,
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Hello World!"),
                    ));
                  },
                  child: const Text("Click here!"))
            ],
          ),
        ),
      ),
    );
  }
}
