import 'package:expense_calc/car_item.dart';
import 'package:flutter/material.dart';

class CarsList extends StatelessWidget {
  CarsList({Key? key, required this.cars}) : super(key: key);
  final cars;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cars ?? const Text("Поки не додано жодного автомобіля"),
    );
  }
}
