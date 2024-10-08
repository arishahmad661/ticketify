import 'package:get_it/get_it.dart';
import 'package:ticketify/data/datasources/event_registration_remote_data_source.dart';
import 'package:ticketify/data/datasources/event_remote_data_source.dart';
import 'package:ticketify/data/datasources/user_detail_remote_data_source.dart';
import 'package:ticketify/data/repositories/event_registration_repository_impl.dart';
import 'package:ticketify/data/repositories/event_repository_impl.dart';
import 'package:ticketify/data/repositories/user_details_repository.dart';
import 'package:ticketify/domain/repositories/event_registration_repository.dart';
import 'package:ticketify/domain/repositories/event_repository.dart';
import 'package:ticketify/domain/repositories/user_details_repository.dart';
import 'package:ticketify/domain/usecases/event_registration.dart';
import 'package:ticketify/domain/usecases/events.dart';
import 'package:http/http.dart' as http;
import 'package:ticketify/domain/usecases/user_detials.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<EventRemoteDataSource>(() => EventRemoteDataSource(getIt()));
  getIt.registerLazySingleton<EventRepository>(() => EventRepositoryImpl(getIt()));
  getIt.registerLazySingleton<FetchEvents>(() => FetchEvents(getIt()));

  getIt.registerLazySingleton<EventRegistrationDataSource>(() => EventRegistrationDataSource(getIt()));
  getIt.registerLazySingleton<EventRegistrationRepository>(() => EventRegistrationImpl(getIt()));
  getIt.registerLazySingleton<EventRegistration>(() => EventRegistration(getIt()));

  getIt.registerLazySingleton<UserDetailsDataSource>(() => UserDetailsDataSource(getIt()));
  getIt.registerLazySingleton<UserDetailsRepository>(() => UserDetailsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<UserDetails>(() => UserDetails(getIt()));
}
