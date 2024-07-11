import 'package:flutter/material.dart';

Widget registerButton({required BuildContext context, required String eventID, required Function(BuildContext, String) onRegister}) {
  return Align(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: (){
        onRegister(context, eventID);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,253,177,75)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),

      ),
      child: const Text("Register", style: TextStyle(color: Color.fromARGB(255,87,33,72), fontSize: 16),),
    ),
  );
}
