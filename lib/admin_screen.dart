import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({Key? key}) : super(key: key);

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  TextEditingController? _passwordController;
  String? enteredPassword;
  String password = "0";
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
              ? const Center(
                  child: Text(
                    "Logged in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
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
                        ? Text(
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
