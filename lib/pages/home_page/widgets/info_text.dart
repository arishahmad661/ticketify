import 'package:flutter/material.dart';
import '../../../common/widgets/text.dart';

Widget infoText() {
  return RichText(
      text: TextSpan(
          text: "Make Your Events ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "Engaging ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: "& ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "Effective!", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
          ]
      )
  );
}

Widget infoText3() {
  return RichText(
      text: TextSpan(
          text: "Not Just Another ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "Ticketing ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: "Platform!", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
          ]
      )
  );
}

Widget infoText2() {
  return RichText(
      text: TextSpan(
          text: "Everyday is a ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "D-day ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: "at ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "Ticketify", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
          ]
      )
  );
}

Widget infoText4() {
  return RichText(
      text: TextSpan(
          text: "Awards ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "& ", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,251,88,80), fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: "Recognition", style: textStyle(fontSize: 38.0, color: Color.fromARGB(255,87,33,72), fontWeight: FontWeight.bold),
            ),
          ]
      )
  );
}