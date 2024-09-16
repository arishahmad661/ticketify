import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> isSelected = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming events", style: textStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
          const SizedBox(height: 16,),
          ToggleButtons(
            isSelected: isSelected,
            fillColor: Colors.blue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16),
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Going", style: textStyle(fontSize: 20.0),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Saved", style: textStyle(fontSize: 20.0),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Suggestion", style: textStyle(fontSize: 20.0),),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          const Center(child: Text("Nothing to see here")),

        ],
      ),
    );
  }
}
