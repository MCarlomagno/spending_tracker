import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BucketsRepository {
  CollectionReference buckets =
      FirebaseFirestore.instance.collection('buckets');

  Future<String> create(Bucket bucket) async {
    DocumentReference<Object?> result = await buckets.add(bucket.toMap());
    return result.id;
  }

  Future<Bucket?> getById(String id) async {
    DocumentReference<Object?> ref = buckets.doc(id);
    DocumentSnapshot<Object?> result = await ref.get();
    return Bucket.fromMap(result.data() as Map<String, dynamic>, result.id);
  }

  Future<List<Bucket>> getAll() async {
    QuerySnapshot<Object?> query = await buckets.get();
    var allBuckets = query.docs
        .map((e) => Bucket.fromMap(e.data() as Map<String, dynamic>, e.id))
        .toList()
        .reversed
        .toList();
    return allBuckets;
  }

  Future<void> updateById(String id, Bucket bucket) async {
    await buckets.doc(id).set(bucket.toMap());
  }

  Future<int?> deleteById(String id) async {
    await buckets.doc(id).delete();
  }
}
