import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/image_upload_controller/image_uploader_controller.dart';
import 'package:vidyaveechi_website/controller/user_login_Controller/user_login_controller.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/utils/shared_pref/user_auth/user_credentials.dart';
import 'package:vidyaveechi_website/view/widgets/blue_Container_widget/blue_Container_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

@override
adminProfileshowlist(BuildContext context) {
  // Rxn<Uint8List> image = Rxn();
  final profileCtr = Get.put(AdminProfileController());

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
                    const TextFontWidget(
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
                      ? AdminProfileEdit()
                      : AdminProfileWidgetOne(),
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
                    const TextFontWidget(
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
                      ? AdminProfileEdit()
                      : AdminProfileWidgetOne(),
                )
              ],
            )),
          ),
  );
}

class AdminProfileEdit extends StatelessWidget {
  AdminProfileEdit({super.key});

  final imageCtr = Get.put(ImageController());
  final profileCtr = Get.put(AdminProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: ResponsiveWebSite.isMobile(context) ? 50 : 70,
                    backgroundImage: imageCtr.selectedImage.isNotEmpty
                        ? NetworkImage(imageCtr.selectedImage.value)
                        : const AssetImage('webassets/png/avathar.png')
                            as ImageProvider,
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
          ),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.nameController,
              hintText: ' Enter your name',
              title: 'Name'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.designationController,
              hintText: ' Designation',
              title: 'Designation'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.aboutController,
              hintText: ' About',
              title: 'About'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.phoneController,
              hintText: ' phone no.',
              title: 'phone no.'),
          TextFormFiledBlueContainerWidgetWithOutColor(
              controller: profileCtr.emailController,
              hintText: ' Email',
              title: 'Email'),
          const TextFontWidget(text: 'Gender *', fontsize: 12.5),
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
                profileCtr.updateAdminProfile();
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

class AdminProfileWidgetOne extends StatelessWidget {
  AdminProfileWidgetOne({
    super.key,
  });
  final profileCtr = Get.put(AdminProfileController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<AdminProfileController>().fetchData(),
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
        } else {
          final data = snapshot.data;
          if (data != null && data.containsKey('collection1')) {
            profileCtr.nameController.text =
                data['collection1']['adminUserName'] ?? "admin";
            profileCtr.designationController.text =
                data['collection1']['designation'] ?? "";
            profileCtr.aboutController.text =
                data['collection1']['about'] ?? "";
            profileCtr.phoneController.text =
                data['collection1']['phoneNumber'] ?? "";
            profileCtr.emailController.text =
                data['collection1']['email'] ?? "";
            profileCtr.gender.value = data['collection1']['gender'] ?? "";

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          backgroundImage: data['collection1']['image'] != null
                              ? NetworkImage(data['collection1']['image'])
                              : const AssetImage('webassets/png/avathar.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
                ////////////////////////////////........................0
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(
                    data['collection1']['adminUserName'] != "" &&
                            data['collection1']['adminUserName'] != null
                        ? data['collection1']['adminUserName']
                        : "admin",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 18,
                        fontWeight: FontWeight.bold),
                  )),
                ), ///////////////////////////////............1
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    data['collection1']['designation'] != "" &&
                            data['collection1']['designation'] != null
                        ? data['collection1']['designation']
                        : "designation",
                    // 'Designation',
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.bold),
                  )),
                ), /////////////////////////..............2
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "About",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 17,
                        fontWeight: FontWeight.bold),
                  ),
                ), /////////////////////////.....................3
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    data['collection1']['about'] != "" &&
                            data['collection1']['about'] != null
                        ? data['collection1']['about']
                        : "About",
                    // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 12 : 15,
                        fontWeight: FontWeight.bold),
                  ),
                ), ////////////////////////..................4
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //////////////////////////////................5
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection1']['phoneNumber'] != "" &&
                                  data['collection1']['phoneNumber'] != null
                              ? data['collection1']['phoneNumber']
                              : "contacts",
                          // '46545645665465',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveWebSite.isMobile(context) ? 14 : 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ///////////////////////////////............................6
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection1']['email'] != "" &&
                                  data['collection1']['email'] != null
                              ? data['collection1']['email']
                              : "email",
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
                ////////////////////////////////////////.............................7
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection1']['gender'] != "" &&
                                  data['collection1']['gender'] != null
                              ? data['collection1']['gender']
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
          } else if (data != null && data.containsKey('collection2')) {
            profileCtr.nameController.text = data['collection2']['username'];
            profileCtr.designationController.text =
                data['collection2']['designation'] ?? "";
            profileCtr.aboutController.text =
                data['collection2']['about'] ?? "";
            profileCtr.phoneController.text =
                data['collection2']['phoneNumber'] ?? "";
            profileCtr.emailController.text =
                data['collection2']['email'] ?? "";
            profileCtr.gender.value = data['collection2']['gender'] ?? "";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          backgroundImage: data['collection2']['image'] != null
                              ? NetworkImage(data['collection2']['image'])
                              : const AssetImage('webassets/png/avathar.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
                ////////////////////////////////........................0
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(
                    data['collection2']['userName'] ?? "admin",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 15 : 18,
                        fontWeight: FontWeight.bold),
                  )),
                ), ///////////////////////////////............1
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    data['collection2']['designation'] ??
                        "no designation details",
                    // 'Designation',
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.bold),
                  )),
                ), /////////////////////////..............2
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "About",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 17,
                        fontWeight: FontWeight.bold),
                  ),
                ), /////////////////////////.....................3
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    data['collection2']['about'] ?? "no About details",
                    // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 12 : 15,
                        fontWeight: FontWeight.bold),
                  ),
                ), ////////////////////////..................4
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: ResponsiveWebSite.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //////////////////////////////................5
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection2']['phoneNumber'] ?? "contacts",
                          // '46545645665465',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveWebSite.isMobile(context) ? 14 : 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ///////////////////////////////............................6
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection2']['email'] ?? "email",
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
                ////////////////////////////////////////.............................7
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          data['collection2']['gender'] ??
                              "no gender details available",
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
        }
      },
    );
  }
}
