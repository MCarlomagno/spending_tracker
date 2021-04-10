import 'package:get_it/get_it.dart';
import 'package:spending_tracker/services/transactions_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<TransactionsService>(() => TransactionsService());
}
