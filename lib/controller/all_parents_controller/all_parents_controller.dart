import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/model/parent_model/parent_model.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class AllParentsController extends GetxController {
  final RxList<ParentModel> parentDetailsList = RxList<ParentModel>();

  Stream<List<ParentModel>> fetchAllParentDetails() {
    return server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .snapshots()
        .asyncMap((collectionSnapshot) async {
      List<ParentModel> allParents = [];

      for (QueryDocumentSnapshot docSnapshot in collectionSnapshot.docs) {
        QuerySnapshot parentCollectionSnapshot = await server
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId)
            .collection('classes')
            .doc(docSnapshot.id)
            .collection('Parents')
            .get();

        for (QueryDocumentSnapshot parentSnapshot
            in parentCollectionSnapshot.docs) {
          final parentDetails = ParentModel.fromMap(
              parentSnapshot.data() as Map<String, dynamic>);
          allParents.add(parentDetails);
        }
      }

      return allParents;
    });
  }
}
