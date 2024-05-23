import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/achievement_model/achievement_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/achievement_datalist.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/create_achievement.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/student_details/widgets/category_tableHeader.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/routeSelectedTextContainer/routeSelectedTextContainer.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: screenContainerbackgroundColor,
        height: 650,
        width: 1200,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Achievements ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 20, bottom: 20),
            //   child: CreateAchievement(),///////////////////////////..................Create Achievements
            // ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  RouteSelectedTextContainer(width: 180, title: 'All Notices'),
                  Spacer(),
                  CreateAchievement()
                ],
              ),
            ),
            Container(
              color: cWhite,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  color: cWhite,
                  height: 40,
                  child: const Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: CatrgoryTableHeaderWidget(headerTitle: 'No')),
                      SizedBox(
                        width: 01,
                      ),
                      Expanded(
                          flex: 3,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Student Name:')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child:
                              CatrgoryTableHeaderWidget(headerTitle: 'Ad NO.')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child:
                              CatrgoryTableHeaderWidget(headerTitle: 'Date')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                          flex: 2,
                          child: CatrgoryTableHeaderWidget(
                              headerTitle: 'Achievement')),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'Edit'),
                      ),
                      SizedBox(
                        width: 02,
                      ),
                      Expanded(
                        flex: 1,
                        child: CatrgoryTableHeaderWidget(headerTitle: 'Delete'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 1200,
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: cWhite,
                  border: Border.all(color: cWhite),
                ),
                child: StreamBuilder(
                    stream: server
                        .collection('SchoolListCollection')
                        .doc(UserCredentialsController.schoolId)
                        .collection(UserCredentialsController.batchId!)
                        .doc(UserCredentialsController.batchId!)
                        .collection('AdminAchievements')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // ignore: prefer_is_empty
                      if (snapshot.data!.docs.length == 0) {
                        return const Center(
                            child: Text(
                          'No Achievements',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ));
                      }
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          AchievementModel data = AchievementModel.fromMap(
                              snapshot.data!.docs[index].data());
                          return AchievementDataList(data: data, index: index);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 02,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
