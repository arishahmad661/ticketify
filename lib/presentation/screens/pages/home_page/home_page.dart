import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/blocs/featured_events/events_bloc.dart';
import 'package:ticketify/blocs/featured_events/events_state.dart';
import 'package:ticketify/presentation/screens/pages/home_page/widgets/featured_events.dart';
import 'package:ticketify/presentation/screens/pages/home_page/widgets/home_page_button.dart';
import 'package:ticketify/presentation/screens/pages/home_page/widgets/info_text.dart';
import 'package:ticketify/presentation/widgets/app_bar.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocConsumer<FeaturedEventsBloc, FeaturedEventState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    infoText(),
                    const SizedBox(height: 5,),
                    const Text("One-stop ticketing & event management platform for online, hybrid and in-person events. We help you drive the right audience & make your event more successful.", style: TextStyle(fontSize: 25),),
                    ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Image.asset("assets/thumbnail.png",)),
                const SizedBox(height: 25,),
                    homePageButton(context),
                    const SizedBox(height: 25,),
                    infoText2(),
                    const SizedBox(height: 5,),
                    const Text("No more dull days! Check out our exciting event line-up and register for upcoming events", style: TextStyle(fontSize: 25),),
                    const SizedBox(height: 25,),
                    const FeaturedEvents(),
                    const SizedBox(
                  height: 25,
                ),
                    infoText3(),
                    const SizedBox(
                  height: 5,
                ),
                    const Text("With Ticketify, you can gamify and amplify your events and make them a \"Sell Out\"", style: TextStyle(fontSize: 25),),
                    const SizedBox(
                  height: 25,
                ),
                    infoText4(),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildNetworkImage(imgURL: "https://intellectual-property-helpdesk.ec.europa.eu/sites/default/files/styles/oe_theme_medium_no_crop/public/2022-02/Startup%20Karnataka.png?itok=kigdZH-_"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildNetworkImage(imgURL: "https://www.ramaiah-evolute.com/wp-content/uploads/2023/01/Ramaiah_Evolute_Logo-removebg-preview-e1675156378676.png"),
                      ),
                    ),
                    const Divider(color: Color.fromARGB(255, 87, 33, 72), thickness: 2,),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.copyright_outlined, color: Color.fromARGB(255, 87, 33, 72),),
                        Text(" Ticketify | 2020 - 2024. All Rights Reserved", style: TextStyle(color: Color.fromARGB(255, 87, 33, 72)),),
                      ],
                    ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
