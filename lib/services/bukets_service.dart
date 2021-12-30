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

}
