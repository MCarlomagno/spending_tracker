import 'package:get_it/get_it.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/services/transactions_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<TransactionsService>(() => TransactionsService());
  getIt.registerLazySingleton<BucketsService>(() => BucketsService());
  getIt.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
}
