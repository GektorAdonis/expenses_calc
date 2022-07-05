import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
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

    void calculateAmorthization() {
      amorthization = (carPrice / generalKilometers) * kilometers;
    }

    void calculateGeneralFuelPrice() {
      generalConsumption = kilometers / 100 * consumption;
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
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (() {
          FocusManager.instance.primaryFocus?.unfocus();
        }),
        child: SafeArea(
          top: true,
          bottom: false,
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
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  euroRate = value.isEmpty ? 0.0 : double.parse(value);
                },
              ),
              CupertinoButton(
                // color: Colors.greenAccent,
                child: const Text(
                  "Порахувати витрати",
                ),
                onPressed: () {
                  calculateExpense();
                  FocusManager.instance.primaryFocus?.unfocus();
                  showTotal();
                },
              ),
              Container(
                child: isTotalShown
                    ? Text(
                        "Витрати: " +
                            (total.isNaN
                                ? 0.toStringAsFixed(2)
                                : total.toStringAsFixed(2)),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
