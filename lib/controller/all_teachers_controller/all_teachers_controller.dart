import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';

class Allteacherscontroller extends GetxController {
  RxList teacherList = [].obs;
  RxString className = ''.obs;
  RxString teacherDocId = ''.obs;
  Stream<QuerySnapshot> getTeacherSubjectsStream() {
    // Reference to the specific class collection
    final classCollectionRef = server 
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId!)
        .doc(UserCredentialsController.batchId!)
        .collection('classes');

    // Return a stream of documents where 'className' is equal to the provided className
    return classCollectionRef
        .where('className', isEqualTo: className.value)
        .snapshots()
        .asyncExpand((classQuerySnapshot) {
      // Check if there are any matching class documents
      if (classQuerySnapshot.docs.isNotEmpty) {
        // Assuming we are only interested in the first match
        var classDocId = classQuerySnapshot.docs.first.id;
        // Reference to the 'teacherSubject' subcollection
        final teacherSubjectCollectionRef = classCollectionRef
            .doc(classDocId)
            .collection('teachers')
            .doc(teacherDocId.value)
            .collection('teacherSubject');
        // Return the stream of the teacherSubject subcollection
        return teacherSubjectCollectionRef.snapshots();
      } else {
        // Return an empty stream if no classes match
        return const Stream<QuerySnapshot>.empty();
      }
    });
  }
}
