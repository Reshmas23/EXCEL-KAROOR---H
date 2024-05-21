import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidebar_drawer/sidebar_drawer.dart';
import 'package:vidyaveechi_website/info/info.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/app_bar/admin_appBar.dart';
import 'package:vidyaveechi_website/view/users/admin/create_new_admin_page/newAdminDetails/new_adminDetails.dart';
import 'package:vidyaveechi_website/view/users/admin/drawer/drawer_pages.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/achievements/all_achievements.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/students_attendance/period_wise.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/attendance_status/teacher_attendance/all_teachers.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/batch_histroy/batch_history_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/class/allclass_listscreen.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/dash_board/admin_dashboard.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/events/all_event_view.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/exam_notification/exam_notification.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/fees_bills/create_fees/view_fees_status.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/general%20instruction/general_instructions.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/login_histroy/login_histroy.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/meeting/all_meeting_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/notice_edit_remove.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notifications/admin_notification_create.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/parents/all_parents_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/non_teachStaff/non_teachusers.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/student/class_list.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/registration_users/teacher/teachers_regi_container.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/students/view_allStudents.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/teacher/view_allTeachers.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/timetable/timetable_main_screen.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/loading_widget/loading_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UserCredentialsController.schoolId !=
                FirebaseAuth.instance.currentUser!.uid
            ? server
                .collection('SchoolListCollection')
                .doc(UserCredentialsController.schoolId)
                .collection('Admins')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots()
            : null,
        builder: (context, snap) {
          if (snap.hasData) {
            return snap.data?.data()?['active'] == false
                ? const Scaffold(
                    body: SafeArea(
                        child: Center(
                      child: TextFontWidget(
                          text: "Waiting for superadmin response.....",
                          fontsize: 20),
                    )),
                  )
                : Scaffold(
                    backgroundColor: cWhite,
                    body: SafeArea(
                      child: SidebarDrawer(
                          body: ListView(
                            children: [
                              AppBarAdminPanel(),
                              pages[selectedIndex],
                            ],
                          ),
                          drawer: Container(
                            color: Colors.white,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            child: Image.asset(
                                              logoImage,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          GooglePoppinsWidgets(
                                            text: institutionName,
                                            fontsize:
                                                ResponsiveWebSite.isMobile(
                                                        context)
                                                    ? 18
                                                    : 20,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 12),
                                      child: Text(
                                        "Main Menu",
                                        style: TextStyle(
                                            color: cBlack.withOpacity(
                                              0.4,
                                            ),
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DrawerSelectedPagesSection(
                                      selectedIndex: selectedIndex,
                                      onTap: (index) {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
          } else if (UserCredentialsController.schoolId ==
              FirebaseAuth.instance.currentUser!.uid) {
            return Scaffold(
              backgroundColor: cWhite,
              body: SafeArea(
                child: SidebarDrawer(
                    body: ListView(
                      children: [
                        AppBarAdminPanel(),
                        pages[selectedIndex],
                      ],
                    ),
                    drawer: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: Image.asset(
                                        logoImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    GooglePoppinsWidgets(
                                      text: institutionName,
                                      fontsize:
                                          ResponsiveWebSite.isMobile(context)
                                              ? 18
                                              : 20,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 12),
                                child: Text(
                                  "Main Menu",
                                  style: TextStyle(
                                      color: cBlack.withOpacity(
                                        0.4,
                                      ),
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DrawerSelectedPagesSection(
                                selectedIndex: selectedIndex,
                                onTap: (index) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            );
          } else {
            return const Scaffold(body: LoadingWidget());
          }
        });
  }
}

List<Widget> pages = [

  const AdminDashBoardSections(),

  AllClassListContainer(),
  AllTeacherRegistrationList(),
  AllNonTeachStaffListContainer(),

  AllStudentListContainer(),
  AllTeacherListContainer(),
  AllParentsListContainer(),

  AllClassListView(),

  CreatedFeesStatus(),

  PeriodWiseStudentsAttendance(),
  AllTeachersAttendance(),

  AllExamNotificationListView(),

  NoticeEditRemove(),

  const AllEventsList(),

  AllMeetingsListPage(),

  AdminNotificationCreate(),

  AllAdminListPage(),

  GeneralInsructions(),

  const Achievements(),


  BatchHistroyListPage(),
  const TimeTableMainScreen(),
  LoginHistroyContainer()
];
List<String> sideMenu = [
  'Attendence',
  'Food Manage',
  'Rooms Manage',
  'Leave Requests',
  'Visitors Pass',
  'Students Manage',
  'Students Payment',
  'Employee Manage',
  'Bill Manage',
  'Notice Board',
  'Settings',
  'Rules',
];
