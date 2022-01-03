import 'package:get_it/get_it.dart';
import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/services/users_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<DatabaseProvider>(() => DatabaseProvider());
  getIt.registerLazySingleton<PaymentsService>(() => PaymentsService());
  getIt.registerLazySingleton<UsersService>(() => UsersService());
  getIt.registerLazySingleton<BucketsService>(() => BucketsService());
  getIt.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
}
