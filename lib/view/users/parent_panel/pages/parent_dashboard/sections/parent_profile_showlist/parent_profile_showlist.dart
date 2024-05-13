import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/parent_profile_controller/parent_profile_controller.dart';
import 'package:vidyaveechi_website/controller/user_login_Controller/user_login_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/firebase/firebase.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

@override
parentProfileshowlist(BuildContext context) {
  final profileCtr = Get.put(ParentProfileController());

  aweSideSheet(
    context: context,
    sheetPosition: SheetPosition.right,
    backgroundColor: cWhite,
    header: Container(),
    showActions: false,
    footer: Container(),
    body: ResponsiveWebSite.isMobile(context)
        ? SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    TextFontWidget(
                      text: "Profile",
                      fontsize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () async {
                            if (kDebugMode) {
                              print("logoutUser");
                            }
                            await Get.find<UserLoginController>()
                                .logoutSaveData()
                                .then((value) => logoutUser());
                            logoutUser();
                          },
                          icon: const Icon(Icons.power_settings_new_sharp)),
                    )
                  ],
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: profileCtr.onTapEdit.value == true
                        ? GestureDetector(
                            onTap: () {
                              profileCtr.onTapEdit.value = false;
                            },
                            child: BlueContainerWidget(
                                title: "Cancel",
                                fontSize: ResponsiveWebSite.isMobile(context)
                                    ? 14
                                    : 16,
                                color: cBlue,
                                width: 80),
                          )
                        : GestureDetector(
                            onTap: () {
                              profileCtr.onTapEdit.value = true;
                            },
                            child: BlueContainerWidget(
                                title: "Edit",
                                fontSize: ResponsiveWebSite.isMobile(context)
                                    ? 14
                                    : 16,
                                color: cBlue,
                                width: 80),
                          ),
                  ),
                ),
                Obx(
                  () => profileCtr.onTapEdit.value == true
                      ? ParentProfileEdit()
                      : ParentProfileView(),
                )
              ],
            )),
          )
        : SingleChildScrollView(
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    TextFontWidget(
                      text: "Profile",
                      fontsize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () async {
                            if (kDebugMode) {
                              print("logoutUser");
                            }
                            await Get.find<UserLoginController>()
                                .logoutSaveData()
                                .then((value) => logoutUser());
                            logoutUser();
                          },
                          icon: const Icon(Icons.power_settings_new_sharp)),
                    )
                  ],
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: profileCtr.onTapEdit.value == true
                        ? GestureDetector(
                            onTap: () {
                              profileCtr.onTapEdit.value = false;
                            },
                            child: BlueContainerWidget(
                                title: "Cancel",
                                fontSize: ResponsiveWebSite.isMobile(context)
                                    ? 14
                                    : 16,
                                color: cBlue,
                                width: 80),
                          )
                        : GestureDetector(
                            onTap: () {
                              profileCtr.onTapEdit.value = true;
                            },
                            child: BlueContainerWidget(
                                title: "Edit",
                                fontSize: ResponsiveWebSite.isMobile(context)
                                    ? 14
                                    : 16,
                                color: cBlue,
                                width: 80),
                          ),
                  ),
                ),
                Obx(
                  () => profileCtr.onTapEdit.value == true
                      ? ParentProfileEdit()
                      : ParentProfileView(),
                )
              ],
            )),
          ),
  );
}

class ParentProfileEdit extends StatelessWidget {
  ParentProfileEdit({super.key});

  final imageCtr = Get.put(ParentImageController());
  final profileCtr = Get.put(ParentProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: ResponsiveWebSite.isMobile(context) ? 50 : 70,
                  backgroundColor: cred,
                  // backgroundImage: NetworkImage(profileCtr.image.value),
                  child: Image.asset('webassets/png/avathar.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 60),
                child: Center(
                  child: CircleAvatar(
                    radius: ResponsiveWebSite.isMobile(context) ? 12 : 15,
                    backgroundColor: Colors.cyanAccent,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 65, left: 90),
                child: GestureDetector(
                  onTap: () async {
                    imageCtr.pickImage();
                  },
                  child: Icon(
                    Icons.edit_square,
                    size: ResponsiveWebSite.isMobile(context) ? 15 : 18,
                  ),
                ),
              )),
            ],
          ),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.nameController,
              hintText: ' Enter your name',
              title: 'Name'),
          // TextFormFiledBlueContainerWidgetWithOutColor(
          //     controller: profileCtr.userRoleController,
          //     hintText: ' userRole',
          //     title: 'UserRole'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.phoneController,
              hintText: ' phone no.',
              title: 'phone no.'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.emailController,
              hintText: ' Email',
              title: 'Email'),
          TextFontWidget(text: 'Gender *', fontsize: 12.5),
          const SizedBox(height: 5),
          Container(
            color: screenContainerbackgroundColor,
            child: DropdownSearch(
              selectedItem: profileCtr.gender.value,
              onSaved: (newValue) {
                profileCtr.gender.value = newValue!;
              },
              onChanged: (value) {
                profileCtr.gender.value = value!;
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      hintText: " Please Select Gender",
                      labelStyle: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 13 : 15,
                      ),
                      contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                      prefixIcon: const Icon(
                        Icons.person_2,
                        size: 20,
                      ))),
              items: const ['Male', 'Female', 'Others'],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                profileCtr.updateParentProfile();
              },
              child: BlueContainerWidget(
                  title: "Save",
                  fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                  color: cBlue,
                  width: 80),
            ),
          ),
        ],
      ),
    );
  }
}

class ParentProfileView extends StatelessWidget {
  ParentProfileView({
    super.key,
  });
  final profileCtr = Get.put(ParentProfileController());

  @override
  Widget build(BuildContext context) {
    final DocumentReference parentCollection = server
        .collection('SchoolListCollection')
        .doc(UserCredentialsController.schoolId)
        .collection(UserCredentialsController.batchId ?? "")
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(UserCredentialsController.classId)
        .collection('Parents')
        .doc(serverAuth.currentUser?.uid);
    return StreamBuilder(
      stream: parentCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.data!.exists && snapshot.data != null) {
          final data = snapshot.data!;
          profileCtr.nameController.text = data['parentName'] ?? "";
          profileCtr.userRoleController.text = data['userRole'] ?? "";
          profileCtr.phoneController.text = data['parentPhoneNumber'] ?? "";
          profileCtr.emailController.text = data['parentEmail'] ?? "";
          profileCtr.gender.value = data['gender'] ?? "";

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // prifile picture
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: CircleAvatar(
                        radius: ResponsiveWebSite.isMobile(context) ? 50 : 70,
                        backgroundColor: cred,
                        backgroundImage: data['profileImageURL'] != "" &&
                                data['profileImageURL'] != null
                            ? NetworkImage(data['profileImageURL'])
                            : const AssetImage('webassets/png/avathar.png')
                                as ImageProvider,
                      ),
                    ),
                  ),
                ],
              ),
              // user name
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                    child: Text(
                  data['parentName'] != "" && data['parentName'] != null
                      ? data['parentName']
                      : "name",
                  style: TextStyle(
                      fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
              // user role
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 25),
                child: Center(
                    child: Text(
                  data['userRole'] != "" && data['userRole'] != null
                      ? data['userRole']
                      : "userRole",
                  style: TextStyle(
                      fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const Divider(
                height: 2,
              ),
              // contacts
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
                child: Text(
                  "Contact details",
                  style: TextStyle(
                      fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //  phone no.
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.phone_iphone,
                        size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        data['parentPhoneNumber'] != "" &&
                                data['parentPhoneNumber'] != null
                            ? data['parentPhoneNumber']
                            : "contacts",
                        style: TextStyle(
                            fontSize:
                                ResponsiveWebSite.isMobile(context) ? 14 : 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //  email
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.email,
                        size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        data['parentEmail'] != "" && data['parentEmail'] != null
                            ? data['parentEmail']
                            : "Parent Email",
                        //  'lepton@gmail.com',
                        style: TextStyle(
                            fontSize:
                                ResponsiveWebSite.isMobile(context) ? 14 : 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //  gender
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Icon(
                        Icons.person,
                        size: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Text(
                        data['gender'] != "" && data['gender'] != null
                            ? data['gender']
                            : "gender",
                        // 'Gender',
                        style: TextStyle(
                            fontSize:
                                ResponsiveWebSite.isMobile(context) ? 14 : 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(child: Text("No data available")),
          );
        }
      },
    );
  }
}
