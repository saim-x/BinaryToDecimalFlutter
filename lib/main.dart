// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController binaryController = TextEditingController();
  int? decimalNumber;

  void binaryToDecimalConverter() {
    String binaryNumber = binaryController.text;
    try {
      decimalNumber = int.parse(binaryNumber, radix: 2);
      if (kDebugMode) {
        print("Binary to Decimal: $binaryNumber -> $decimalNumber");
      }
      // Do something with the converted decimal value
    } catch (e) {
      
      print("Invalid Binary Number: $binaryNumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binary to Decimal Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Binary to Decimal Converter'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Binary to Decimal Converter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Enter a binary number (0s and 1s)",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: binaryController,
                  decoration: InputDecoration(
                    labelText: "Binary Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    binaryToDecimalConverter();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6200EE),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Convert",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                  ),
                ),
              ),
              // Display the converted decimal number
              if (decimalNumber != null)
                Column(
                  children: [
                    Text(
                      "Converted Decimal Number:",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "$decimalNumber",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
