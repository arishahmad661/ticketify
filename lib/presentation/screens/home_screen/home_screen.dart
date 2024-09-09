import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/presentation/screens/home_screen/widgets/featured_events.dart';
import 'package:ticketify/presentation/widgets/text.dart';
import '../../../blocs/featured_events/events_bloc.dart';
import '../../../blocs/featured_events/events_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              elevation: MaterialStateProperty.all(0.0),
              side: MaterialStateProperty.all(BorderSide(color: Colors.grey, )),
              shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
              onTap: (){},
              onChanged: (_){},
              leading: Icon(Icons.search, color: Colors.black54,),
              hintText: "Explore upcoming events",
              hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.black54)),
              controller: controller,
            );
        },
          suggestionsBuilder: (BuildContext context, SearchController controller) { return List.generate(3, (index) => Text(index.toString())); },

        )
      ),
      body: BlocConsumer<FeaturedEventsBloc, FeaturedEventState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Find events near ",style: textStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "Lucknow", style: textStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)
                              ),
                            ]
                        ),
                      ),
                      Icon(Icons.edit, color: Colors.blueAccent,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  ClipRRect(borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/maps.png")
                  ),
                  Divider(),
                  Text("Discover events by date", style: textStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  SizedBox(height: 4,),
                  Wrap(
                    runSpacing: 8.0,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Today"),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tomorrow"),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("This weekend"),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Choose date"),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("All upcoming"),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Find a group you like"),
                    subtitle: Text("Match your interest with a group"),
                    trailing: Image.asset("assets/right-arrow.png"),
                    leading: Icon(Icons.search),
                  ),
                  Divider(),
                  SizedBox(height: 8,),
                  Text("Explore Ticketify", style: textStyle(fontWeight: FontWeight.bold, fontSize:20.0)),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular now", style: textStyle(fontSize: 16.0),),
                      Text("See all", style: textStyle(fontSize: 16.0, color: Colors.blue),),
                    ],
                  ),
                  SizedBox(height: 4,),
                  const FeaturedEvents(),

                  Divider(),
                  ListTile(
                    title: Text("Start a new group"),
                    subtitle: Text("Organise your own events"),
                    trailing: Image.asset("assets/right-arrow.png"),
                    leading: Icon(Icons.group),
                  ),
                  Divider(),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
