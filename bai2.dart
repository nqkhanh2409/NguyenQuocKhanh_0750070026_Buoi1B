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

// Product List
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách sản phẩm", style: TextStyle(fontSize: 25)),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 590,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                    leading: const Icon(Icons.car_rental),
                    title: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    // trailing: const Icon(Icons.more_vert),
                    hoverColor: Colors.grey[350],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => _MyProductDetail())
                      );
                    },
                  );
              }),
        ),
      ),
    );
  }
}


// Product Detail
class _MyProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết sản phẩm", style: TextStyle(fontSize: 25)),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 590,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network('https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                width: 400),
              ),
              const Text("Tên sản phẩm", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              const Text("Mô tả sản phẩm", style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal))
            ],
          )
        ),
      ),
    );
  }
}
