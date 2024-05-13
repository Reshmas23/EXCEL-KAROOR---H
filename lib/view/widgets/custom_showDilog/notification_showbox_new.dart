import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/custom_showDilog/notice_showdialogebox.dart';

notificationShowboxNew(BuildContext context, data) {
  noticeCustomShowDilogBox(
    context: context,
   
    children: [
      
      Stack(
        children: [
          Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 10, bottom: 10, right: 10),
                      child: Expanded(
                        child: Container(
                          height: 350,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: cBlack, width: 0.5),
                            color: const Color.fromARGB(236, 187, 184, 184),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border.all(color: cBlack, width: 0.1),
                                  color: const Color.fromARGB(255, 197, 70, 61),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 80,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                "IMPORTANT NOTICE",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 197, 70, 61),
                                            border: Border.all(
                                                width: 0.1, color: cBlack)),
                                        height: 23,
                                        width: 23,
                                        child: Icon(
                                          Icons.close,
                                          color: cWhite,
                                          size: 20,
                                          opticalSize: 10,
                                        ), ////////////////////////////////.................. Close Icon
                                      ),
                                    ),
                                  ],
                                ),
                              ), /////////////////////////////////.............Red Container
                              Expanded(
                                child: Container(
                                  height:
                                      // ResponsiveWebSite.isMobile(context)
                                      // ? 172:
                                      150,
                                  color: cWhite,
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 30,
                                        left: 15,
                                        right: 15,
                                        bottom: 15),
                                    child: TextField(
                                      maxLines: 10,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter a search term',
                                      ),
                                    ),
                                  ),
                                ),
                              ), ////////////////////////////.....................Text Field
                              Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  // border: Border(bottom: BorderSide(color: cBlack,width: 0.1),left: BorderSide(color: cBlack,width: 0.1),right: BorderSide(color: cBlack,width: 0.1),),
                                  color: cWhite,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: const Color.fromARGB(
                                                255, 234, 227, 227),
                                          ),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Icon(
                                                  Icons.forward_to_inbox,
                                                  size: 25,
                                                  color: Color.fromARGB(
                                                      255, 220, 2, 2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 197, 70, 61),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "SEND",
                                                  style: TextStyle(
                                                    color: cWhite,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              // Spacer(),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons
                                                      .arrow_circle_right_rounded,
                                                  color: cWhite,
                                                  size: 30,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), ///////////////////////////...................Notice Container
                    ),
                  ],
                ),
              ),
            ],
          ), ///////////////////////////.................Blue Container
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 43),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Color.fromARGB(255, 141, 14, 5),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: cWhite,
                child: Icon(
                  Icons.priority_high,
                  color: cred,
                  size: 30,
                ),
              ),
            ),
          ), //////////////////////////////...........circle avatar
        ],
      ),
    ],
  );
}
