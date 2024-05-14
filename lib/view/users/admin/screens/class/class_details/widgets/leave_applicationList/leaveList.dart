import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/class_controller/class_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/data_list_widgets/data_container.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class LeaveApplicationData extends StatelessWidget {
  final int index;
  final dynamic data;
  final int compare;
  const LeaveApplicationData({
    required this.index,
    required this.data,
    super.key,
    required this.compare,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                height: 600,
                width: 500, // Set your desired height here
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back)),
                        Container(
                          width: ResponsiveWebSite.isMobile(context) ? 60 : 150,
                        ),
                        const Center(
                            child: Text(
                          'Leave Letter',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'To',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'The Teacher',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              UserCredentialsController.schoolName ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Subject: Application For Leave',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Leave Type: ${data['leaveResontype']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Respected Sir,',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            const Text("I would like to inform you that due to",
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text(
                              '${data['leaveReason']}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                                "my child ${data['studentName']} would not be able to attend the classes ",
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text(
                                'from ${data['leaveFromDate']} to ${data['leaveToDate']}. Therefore, I humbly request',
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            const Text('you to grant leave.',
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 20),
                            const Text('Thanking You,',
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            const Text('Yours sincerely,',
                                style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text('${data['studentParent']}',
                                style: const TextStyle(fontSize: 16)),
                            const SizedBox(height: 5),
                            Text('Date: ${data['applyLeaveDate']} ',
                                style: const TextStyle(fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: index % 2 == 0
              ? const Color.fromARGB(255, 246, 246, 246)
              : Colors.blue[50],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: TextFontWidget(
                    fontsize: 12,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    text: '${index + 1}'),
              ), //....................No
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: TextFontWidget(
                  fontsize: 12,
                  color: cWhite,
                  index: index,
                  text: data['id'] != null
                      ? data['id'].toString()
                      : 'List is Empty',
                ),
              ),
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Image.asset(
                        'webassets/stickers/icons8-student-100 (1).png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 05,
                  ),
                  Expanded(
                    child: DataContainerWidget(
                      headerTitle: data['studentName'] != null
                          ? data['studentName'].toString()
                          : 'List is Empty',
                      rowMainAccess: MainAxisAlignment.start,
                      index: index,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: TextFontWidget(
                  fontsize: 12.5,
                  color: cWhite,
                  // width: 150,
                  index: index,
                  // ignore: unnecessary_null_comparison
                  text: compare == null
                      ? 'Compare value not available'
                      : compare == 0
                          ? 'For ${compare + 1} Day'
                          : 'For ${compare + 1} Days',
                ),
                //  compare != null ? '$compare Days' : 'Compare value not available',
              ),
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: TextFontWidget(
                    fontsize: 12.5,
                    color: cWhite,
                    // width: 150,
                    index: index,
                    text: data['applyLeaveDate'] != null
                        ? data['applyLeaveDate'].toString()
                        : 'List is Empty'),
              ),
            ),
            const SizedBox(
              width: 02,
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                    child: Image.asset(
                      'webassets/png/telephone.png',
                    ),
                  ),
                  const SizedBox(
                    width: 05,
                  ),
                  StreamBuilder(
                      stream: server
                          .collection('SchoolListCollection')
                          .doc(UserCredentialsController.schoolId)
                          .collection(UserCredentialsController.batchId!)
                          .doc(UserCredentialsController.batchId!)
                          .collection('classes')
                          .doc(Get.find<ClassController>().classDocID.value)
                          .collection('Students')
                          .where('studentName', isEqualTo: data['studentname'])
                          .snapshots(),
                      builder: (context, snapshot) {
                        return TextFontWidget(
                            fontsize: 12,
                            color: cWhite,
                            index: index,
                            text: snapshot.data!.docs[index]
                                        ['parentPhoneNumber'] ==
                                    null
                                ? 'Phone Number not available'
                                : snapshot
                                    .data!.docs[index]['parentPhoneNumber']
                                    .toString());
                      }),
                ],
              ),
            ),
            const SizedBox(
              width: 02,
            ),
          ],
        ),
      ),
    );
  }
}
