import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? _kilometersController;
  TextEditingController? _fuelPriceController;
  TextEditingController? _exchangeRateController;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text("Введіть кілометраж"),
                CupertinoTextField(
                  controller: _kilometersController,
                  keyboardType: TextInputType.number,
                ),
                Text('Введіть ціну палива'),
                CupertinoTextField(
                  controller: _fuelPriceController,
                  keyboardType: TextInputType.number,
                ),
                Text("Введіть курс євро"),
                CupertinoTextField(
                  controller: _exchangeRateController,
                  keyboardType: TextInputType.number,
                ),
                CupertinoButton(
                    child: Text("Порахувати витрати"), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
