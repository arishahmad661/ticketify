import 'package:get_it/get_it.dart';
import 'package:ticketify/data/datasources/event_remote_data_source.dart';
import 'package:ticketify/data/repositories/event_repository_impl.dart';
import 'package:ticketify/domain/repositories/event_repository.dart';
import 'package:ticketify/domain/usecases/fetch_events.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<EventRemoteDataSource>(() => EventRemoteDataSource(getIt()));
  getIt.registerLazySingleton<EventRepository>(() => EventRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => FetchEvents(getIt()));
}
