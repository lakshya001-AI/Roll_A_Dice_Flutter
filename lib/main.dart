import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imagesNames = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png'
  ];

  String currentImage = 'assets/images/dice-2.png';
  void rolldice(){
    final random = Random();
    final randomIndex = random.nextInt(imagesNames.length);
    final randomImageName = imagesNames[randomIndex];

    setState(() {
      currentImage = randomImageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Roll Dice' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 60),
              Image.asset( currentImage, width: 300),
              const SizedBox(height: 60),
              SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    rolldice();
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                  child: const Text(
                    "Roll a Dice",
                    style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold ),
                  ),
                ),
              ),

            ],
              ),
        ),
      )
    );
  }
}


