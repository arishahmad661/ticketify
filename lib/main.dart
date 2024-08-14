import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketify/bloc/featured_events/events_bloc.dart';
import 'package:ticketify/pages/login_page/sign_in.dart';
import 'bloc/event_registration/event_registration_bloc.dart';
import 'bloc/login/auth_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => FeaturedEventsBloc(),
        ),
        BlocProvider(
          create: (context) => EventRegistrationBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticketify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignIN(),
      ),
    );
  }
}
