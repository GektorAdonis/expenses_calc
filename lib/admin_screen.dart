import 'package:expense_calc/car_item.dart';
import 'package:expense_calc/cars_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController? _passwordController;
  TextEditingController? _carNameController;
  TextEditingController? _consumptionController;
  List<CarItem> cars = [];
  String? enteredPassword;
  String password = "0";
  String carName = "";
  double consumption = 0.0;
  bool isLoggedIn = false;
  bool isPasswordWrong = false;

  void checkPassword(String enteredPassword) {
    if (enteredPassword == password) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isPasswordWrong = true;
      });
    }
  }

  void showAddingCar() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          //insetAnimationCurve: Curves.decelerate,
          content: Column(
            children: [
              const Text("Введіть назву автомобіля"),
              CupertinoTextField(
                controller: _carNameController,
                onChanged: (value) {
                  carName = value;
                },
              ),
              const Text("Введіть розхід пального"),
              CupertinoTextField(
                controller: _consumptionController,
                onChanged: (value) {
                  consumption = double.parse(value);
                },
              ),
            ],
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: addCar,
              child: Text("Додати"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Скасувати"),
              isDestructiveAction: true,
            )
          ],
        );
      },
    );
  }

  void addCar() {
    setState(() {
      cars.add(CarItem(
        carName: carName,
        consumption: consumption,
      ));
    });
    print(carName);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          top: true,
          child: isLoggedIn
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CarsList(
                      cars: cars,
                    ),
                    CupertinoButton(
                      child: const Text("Додати автомобіль"),
                      onPressed: () {
                        showAddingCar();
                      },
                    ),
                  ],
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Введіть пароль",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    CupertinoTextField(
                      controller: _passwordController,
                      onChanged: (value) {
                        enteredPassword = value;
                      },
                    ),
                    isPasswordWrong
                        ? const Text(
                            "Пароль неправильний, спробуйте ще раз",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                    CupertinoButton(
                        child: const Text("Ввести"),
                        onPressed: () {
                          checkPassword(enteredPassword ?? "");
                        })
                  ],
                ),
        ),
      ),
    );
  }
}
