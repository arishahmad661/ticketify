import 'package:flutter/material.dart';
import 'IconView.dart';
import 'ticket_view.dart';

class SplashPageWidget extends StatelessWidget {
  final title, desc, icon1, icon2, icon3, summ1, summ2, summ3;
  const SplashPageWidget({super.key, this.title, this.desc, this.icon1, this.icon2, this.icon3, this.summ1, this.summ2, this.summ3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ticketView(title: title, desc: desc),
          SizedBox(height: 20,),
          IconView(summ1: summ1, summ2: summ2, summ3: summ3, icon1: icon1, icon2: icon2, icon3: icon3)
        ],
      ),
    );
  }


}
