import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/repositories/buckets_repository.dart';

class BucketsService {
  var bucketsRepository = new BucketsRepository();

  create({required Bucket bucket}) async {
    await bucketsRepository.create(bucket);
  }

  Future<List<Bucket>> getAll() async {
    List<Bucket> allBuckets = await bucketsRepository.getAll();
    return allBuckets;
  }

  Future<void> deleteById(int id) async {
    await bucketsRepository.deleteById(id);
  }

  Future<void> changeAmount(int id, {double? amount}) async {
    Bucket? bucket = await bucketsRepository.getById(id);
    if (bucket != null && amount != null) {
      bucket.amount += amount;
      await bucketsRepository.updateById(id, bucket);
    }
  }

  Future<void> patchById(int id, {double? amount}) async {
    Bucket? bucket = await bucketsRepository.getById(id);
    if (bucket != null && amount != null) {
      bucket.amount = amount;
      await bucketsRepository.updateById(id, bucket);
    }
  }
}
