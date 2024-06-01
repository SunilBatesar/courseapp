import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/data/network/baseapi_service.dart';

class NetworkFirebaseService extends FirebaseService {
  final firebase = FirebaseFirestore.instance;
  @override
  Future get(path) {
    Future<Object> response;
    if (path is CollectionReference) {
      response = path.get();
      // TODO ;; IMPLEMENT COLLECTION FUNCTIONALITY
    } else if (path is Query<Map<String, dynamic>>) {
      response = path.get();
      // TODO ;; IMPLEMENT WHERE METHOD COLLECTION FUNCTIONALITY
    } else {
      response = (path as DocumentReference).get();
      // TODO;; IMPLEMENT DOCUEMENT FUNCTIONALITY
    }

    return response;
  }

  @override
  Future post(path, data) {
    Future<void> response;
    if (path is CollectionReference) {
      response = path.add(data);
      // TODO ;; IMPLEMENT COLLECTION FUNCTIONALITY
    } else {
      response = (path as DocumentReference).set(data);
      // TODO;; IMPLEMENT DOCUEMENT FUNCTIONALITY
    }

    return response;
  }

  @override
  Future update(path, data) {
    return (path as DocumentReference).update(data);
    // TODO;; UPDATE DOCUEMENT FUNCTIONALITY
  }
}
