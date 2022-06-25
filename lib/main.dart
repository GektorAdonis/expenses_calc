import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Expense Calculator',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Colors.amber,
      ),
      home: MyHomePage(),
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
  final carPrice = 15000.0;
  final consumption = 10.0;
  final driverPercent = 0.15;
  double kilometers = 0.0;
  final generalKilometers = 1000000.0;
  double amorthization = 0.0;
  double fuelPrice = 0.0;
  double euroRate = 0.0;
  double generalConsumption = 0.0;
  double generalFuelPrice = 0.0;
  double generalFuelPriceInEuro = 0.0;
  final pricePerKilometer = 0.1;
  double generalPriceForKilometers = 0.0;
  double driverSalary = 0.0;
  double total = 0.0;
  bool isTotalShown = false;

  @override
  Widget build(BuildContext context) {
    void calculateAmorthization() {
      amorthization = (carPrice / generalKilometers) * kilometers;
    }

    void calculateGeneralFuelPrice() {
      generalConsumption = (kilometers / consumption);
      generalFuelPrice = generalConsumption * fuelPrice;
    }

    void calculateGeneralFuelPriceInEuro() {
      calculateGeneralFuelPrice();
      generalFuelPriceInEuro = generalFuelPrice / euroRate;
    }

    void calculateExpense() {
      calculateGeneralFuelPriceInEuro();
      calculateAmorthization();
      total = generalFuelPriceInEuro + amorthization;
    }

    void showTotal() {
      setState(() {
        isTotalShown = true;
      });
    }

    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Введіть кілометраж",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          CupertinoTextField(
            controller: _kilometersController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              kilometers = value.isEmpty ? 0.0 : double.parse(value);
            },
          ),
          const Text(
            'Введіть ціну палива',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          CupertinoTextField(
            controller: _fuelPriceController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              fuelPrice = value.isEmpty ? 0.0 : double.parse(value);
            },
          ),
          const Text(
            "Введіть курс євро",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          CupertinoTextField(
            controller: _exchangeRateController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              euroRate = value.isEmpty ? 0.0 : double.parse(value);
            },
          ),
          CupertinoButton(
            color: Colors.greenAccent,
            child: const Text(
              "Порахувати витрати",
            ),
            onPressed: () {
              calculateExpense();
              showTotal();
            },
          ),
          Container(
            child: isTotalShown
                ? Text(
                    "Витрати: " + total.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
