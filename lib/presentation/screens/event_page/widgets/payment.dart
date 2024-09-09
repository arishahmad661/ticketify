import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/event_registration/event_registration_event.dart';
import 'package:ticketify/data/models/featured_events_model.dart';
import 'package:ticketify/data/models/order_id_request.dart';

class Payment extends StatelessWidget {
  FeaturedEventModel eventDetails;
  Payment({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        BlocProvider.of<EventRegistrationBloc>(context).add(
            CreateOrderID(orderIDRequest: OrderIDRequest(currency: 'INR', amount: eventDetails.cost))
        );
      }, // Trigger the payment on button press
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,251,88,80)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        minimumSize: MaterialStateProperty.all(const Size(160, 50)),
      ),
      child: Text(
        "Pay \$${eventDetails.cost}",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
