import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/repositories/buckets_repository.dart';
import 'package:spending_tracker/services/authentication_service.dart';

import '../setup.dart';

class BucketsService {
  var bucketsRepository = new BucketsRepository();
  var _authenticationService = getIt.get<AuthenticationService>();

  create({required Bucket bucket}) async {
    await bucketsRepository.create(bucket);
  }

  Future<List<Bucket>> getAll() async {
    String uid = _authenticationService.currentUser!.uid;
    List<Bucket> allBuckets = await bucketsRepository.getAll(uid: uid);
    return allBuckets;
  }

  Future<void> deleteById(String id) async {
    await bucketsRepository.deleteById(id);
  }

  Future<void> changeAmount(String id, {double? amount}) async {
    Bucket? bucket = await bucketsRepository.getById(id);
    if (bucket != null && amount != null) {
      bucket.amount += amount;
      await bucketsRepository.updateById(id, bucket);
    }
  }

  Future<void> patchById(String id, {double? amount}) async {
    Bucket? bucket = await bucketsRepository.getById(id);
    if (bucket != null && amount != null) {
      bucket.amount = amount;
      await bucketsRepository.updateById(id, bucket);
    }
  }
}
