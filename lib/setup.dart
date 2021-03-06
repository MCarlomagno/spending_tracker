import 'package:get_it/get_it.dart';
import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/services/transactions_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<DatabaseProvider>(() => DatabaseProvider());
  getIt.registerLazySingleton<PaymentsService>(() => PaymentsService());
}
