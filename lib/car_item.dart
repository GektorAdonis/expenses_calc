import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    Key? key,
    required this.carName,
    this.consumption,
  }) : super(key: key);
  final carName;
  final consumption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$carName",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "Розхід: ${consumption}л ",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
