import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ticketify/blocs/event_registration/event_registration_bloc.dart';
import 'package:ticketify/blocs/submit_organiser_form/form_bloc.dart';
import 'package:ticketify/domain/usecases/event_registration.dart';
import 'package:ticketify/domain/usecases/events.dart';
import 'package:ticketify/domain/usecases/user_detials.dart';
import 'package:ticketify/presentation/screens/login_screen/sign_in.dart';
import 'blocs/authentication/auth_bloc.dart';
import 'blocs/featured_events/events_bloc.dart';
import 'firebase_options.dart';
import 'core/di/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.setup();
  await dotenv.load(fileName: 'server/.env');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(di.getIt<UserDetails>()),
        ),
        BlocProvider(
          create: (context) => FeaturedEventsBloc(fetchEvents: di.getIt<FetchEvents>()),
        ),
        BlocProvider(
          create: (context) => EventRegistrationBloc(eventRegistration: di.getIt<EventRegistration>()),
        ),
        BlocProvider(
          create: (context) => SubmitOrganiserFormBloc(events: di.getIt<FetchEvents>()),
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
