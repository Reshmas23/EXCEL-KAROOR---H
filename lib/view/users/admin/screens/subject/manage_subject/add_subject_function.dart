import 'package:awesome_side_sheet/Enums/sheet_position.dart';
import 'package:awesome_side_sheet/side_sheet.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/constant/constant.validate.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/users/admin/screens/subject/manage_subject/edit_subject.dart';
import 'package:vidyaveechi_website/view/widgets/textformFiledContainer/textformFiledBlueContainer.dart';

addSubjectFunction(BuildContext context){
aweSideSheet(context: context, 
sheetPosition:  SheetPosition.right,
backgroundColor: cWhite,
footer: Container(),
header: Container(),
body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(children: [ 
                    BackButton(),
                    TextFontWidget(text: "Add New Subject", fontsize: 17,fontWeight: FontWeight.bold,)
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10, top: 0),
                    child: TextFormFiledBlueContainerWidget(
                      hintText: " Enter Subject Name",
                      title: 'Subject Name',
                      validator: checkFieldEmpty,
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: themeColorBlue,
                          border: Border.all(color: themeColorBlue),
                          borderRadius: BorderRadius.circular(05)),
                      child:  Center(
                        child: TextFontWidget(
                          text: "Create Subject",
                          fontsize: 14,
                          // fontWeight: FontWeight.w600,
                          color: cWhite,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: cWhite,
                      height: 350,
                      width: 500,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            //final data = ClassModel.fromMap(
                            //    snap.data!.docs[index].data());
                            return Padding(
                              padding: const EdgeInsets.only(left: 10, top: 08),
                              child:
                              //  data.editoption == true
                              //     ? ClassNameEditWidget(
                              //         docid: data.docid,
                              //       )
                              //     :
                                   Container(
                                      color: Colors.blue.withOpacity(0.2),
                                      height: 35,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                           Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                              height: 35,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFontWidget(
                                                  text: 'data.classNameb husdgj kjndck kjsndk sgdb sfhbk sfkkhk',
                                                  fontsize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                                color:screenContainerbackgroundColor,
                                                height: 35,
                                             //   width: 90,
                                                child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Tooltip(
                                                      message:'Add Subject to this batch year',
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        //  => Get.find<
                                                        //         ClassController>()
                                                        //     .setClassForbatchYear(
                                                        //         data.className,
                                                        //         data.docid),
                                                        child: const Icon(
                                                          weight: 50,
                                                          Icons.add,
                                                          color: themeColorBlue,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ), ///////////////////////////................add
                                                    Container(
                                                      width: 1,
                                                      color: cWhite,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                         editFunctionOfSubject( context);
                                                      },
                                                      child: const Icon(
                                                        Icons.edit,
                                                        color: cgreen,
                                                        size: 18,
                                                      ),
                                                    ), ///////////////////////////...edit
                                                    Container(
                                                      width: 1,
                                                      color: cWhite,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Get.find<
                                                        //         ClassController>()
                                                        //     .deleteClass(
                                                        //         data.docid,
                                                        //         context);
                                                      },
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: cred,
                                                        size: 18,
                                                      ),
                                                    ), /////////////////////////delete
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 1,),
                          itemCount: 10)
                    ),
                  ),
                
                ],
              ),
            ),
          ],
        ), );
}