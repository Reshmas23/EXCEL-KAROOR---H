import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/achievements_controller/achievements.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/drop_down/select_class.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/notice/noticebutton_container.dart';
import 'package:vidyaveechi_website/view/users/super_admin/widgets/buttonContainer.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class CreateAchievement extends StatefulWidget {
  const CreateAchievement({super.key});

  @override
  State<CreateAchievement> createState() => _CreateAchievementState();
}

class _CreateAchievementState extends State<CreateAchievement> {
  final AchievementsController achievementsController =
      Get.put(AchievementsController());

  @override
  Widget build(BuildContext context) {
    List<Widget> textformWidget = [
      Padding(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
        child: Container(
          height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
          color: cWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFontWidget(text: 'Select Class *', fontsize: 12.5),
              const SizedBox(
                height: 05,
              ),
              SizedBox(
                height: 50,
                child: SelectClassDropDown(),
              ),
            ],
          ),
        ),
      ), ///////////////////////////////////////////////////////////////////////0
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          controller: achievementsController.studentNameController,
          validator: checkFieldEmpty,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Student name',
          hintText: 'Student name', /////////////////////////////////////////1
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          onTap: () {
            achievementsController.selectDate(
                context, achievementsController.dateController);
          },
          validator: checkFieldDateIsValid,
          controller: achievementsController.dateController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          hintText: 'Date',
          title: 'Date',
        ),
      ), ////////////////////////////////////////////////////////2
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          validator: checkFieldEmpty,
          controller: achievementsController.admissionNumberController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Admission Number',
          hintText: 'Admission Number',
        ),
      ), ///////////////////////////////////////////////3
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: TextFormFiledBlueContainerWidgetAchievement(
          validator: checkFieldEmpty,
          controller: achievementsController.achievementController,
          width: ResponsiveWebSite.isMobile(context) ? double.infinity : 500,
          title: 'Achievement head',
          hintText: 'Achievement head',
        ),
      ), ////////////////////////////////////4

      const Expanded(
          child: SizedBox(
        height: 40,
        width: 400,
      ))
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          GestureDetector(
              ///////////////////////////////////////////////////////////////////////////////////
              onTap: () {
                aweSideSheet(
                    context: context,
                    sheetPosition: SheetPosition.right,
                    header: Container(),
                    body: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: SingleChildScrollView(
                        child: Form(
                          key: achievementsController.formKey,
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  BackButton(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextFontWidget(
                                    text: 'Acheivements',
                                    fontsize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 800,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child:
                                        //  Obx(() {
                                        // return
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                          // Stack(
                                          //   children: [
                                          //     // Obx(() {
                                          //     (achievementsController.afile ==
                                          //             null)
                                          //         ? const CircleAvatar(

                                          //             radius: 60,
                                          //             backgroundImage: NetworkImage(
                                          //                 'https://via.placeholder.com/150'),
                                          //             backgroundColor:
                                          //                 Color.fromARGB(241,
                                          //                     54, 225, 248),
                                          //           )
                                          //         : CircleAvatar(
                                          //             radius: 60,

                                          //             backgroundImage: MemoryImage(
                                          //                 achievementsController
                                          //                     .afile!)
                                          //             //
                                          //             //   .image,
                                          //             ),

                                          //     // }
                                          //     // }),
                                          //     Positioned(
                                          //         bottom: -10,
                                          //         left: 80,
                                          //         child: IconButton(
                                          //             onPressed: () async {
                                          //               FilePickerResult?
                                          //                   result =
                                          //                   await FilePicker
                                          //                       .platform
                                          //                       .pickFiles(
                                          //                           type: FileType
                                          //                               .image);
                                          //               if (result != null) {
                                          //                 achievementsController
                                          //                         .file =
                                          //                     result.files.first
                                          //                         .bytes;
                                          //                 setState(() {
                                          //                   achievementsController
                                          //                           .afile =
                                          //                       achievementsController
                                          //                           .file;
                                          //                 });
                                          //               }
                                          //             },
                                          //             icon: const Icon(
                                          //                 Icons.add_a_photo)))
                                          //   ],
                                          // ),
                                          textformWidget[0],
                                          textformWidget[1],
                                          textformWidget[2],

                                          textformWidget[3],
                                          textformWidget[4],

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: NoticeButtonContainerWidget(
                                              text: 'Submit',
                                              width: 300,
                                              height: 50,
                                              fontSize: 18,
                                              onTap: () {
                                                if (achievementsController
                                                    .formKey.currentState!
                                                    .validate()) {
                                                  achievementsController
                                                      .uploadImageToStorage();
                                                }
                                              },
                                              color: AppColors.blueDarkColor,
                                            ),
                                          )
                                          // }),
                                        ]),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    showCloseButton: false,
                    footer: Container());
              }, /////////////////////////////////////////////////////////////create function
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 40,
                  width: 180,
                  child: const Center(
                    child: TextFontWidgetRouter(
                      text: 'Create Achievement',
                      fontsize: 14,
                      fontWeight: FontWeight.bold,
                      color: cWhite,
                    ),
                  ))),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiledBlueContainerWidgetAchievement extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final String title;
  final String hintText;
  final Widget? widget;
  final double? width;
  Function(String)? onChanged;
  Iterable<String>? autofillHints;
  String? Function(String?)? validator;
  Function()? onTap;
  TextInputType? keyboardType;
  TextFormFiledBlueContainerWidgetAchievement({
    this.width,
    this.widget,
    required this.hintText,
    required this.title,
    this.keyboardType,
    this.controller,
    this.autofillHints,
    this.onChanged,
    this.validator,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWebSite.isMobile(context) ? 80 : 100,
      // color: cWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFontWidget(text: '$title *', fontsize: 12.5),
              widget == null ? const SizedBox() : widget!,
            ],
          ),
          const SizedBox(
            height: 05,
          ),
          Container(
            height: 40,
            width: width,
            color: screenContainerbackgroundColor,
            child: Center(
              child: TextFormField(
                onChanged: onChanged,
                autofillHints: autofillHints,
                onTap: onTap,
                validator: validator,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        width: 0.4,
                        style: BorderStyle.none,
                        color: Colors.red,
                      )),
                  focusedErrorBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      width: 0.4,
                      style: BorderStyle.none,
                      color: Colors.red,
                    ),
                  ),
                  // contentPadding: const EdgeInsets.all(8.0),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0.4)),
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: hintText,
                  focusedBorder: const OutlineInputBorder(
                    //<-- SEE HERE
                    borderSide: BorderSide(width: 1, color: Colors.green),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
