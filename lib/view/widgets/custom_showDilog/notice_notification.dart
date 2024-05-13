import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class NoticeNotification extends StatelessWidget {
  const NoticeNotification({super.key});

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    
      return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      // height: 730,
                      
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 236, 234, 234),
                        border: Border(top: BorderSide(color: cBlack,width: 0.5))
                    
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                height:
                                    ResponsiveWebSite.isMobile(context) ? 400 : 350,
                                width:
                                    ResponsiveWebSite.isMobile(context) ? 450 : 600,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: cBlack, width: 0.5),
                                  color: const Color.fromARGB(236, 187, 184, 184),
                                ),
                                // color: const Color.fromARGB(236, 187, 184, 184),
                                child: Column(
                                  children: [
                                    Container(
                                      height: ResponsiveWebSite.isMobile(context)
                                          ? 30
                                          : 40,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        border:
                                            Border.all(color: cBlack, width: 0.1),
                                        color: const Color.fromARGB(255, 197, 70, 61),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:
                                                ResponsiveWebSite.isMobile(context)
                                                    ? 9
                                                    : 13,
                                            child: Padding(
                                              padding: EdgeInsets.only( left: ResponsiveWebSite.isMobile(context)
                                                                    ? 70
                                                                    : 90,),
                                              child: const Column(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("IMPORTANT NOTICE",style: TextStyle(fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            // flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 197, 70, 61),
                                                    border: Border.all(
                                                        width: 0.1, color: cBlack)),
                                                height: ResponsiveWebSite.isMobile(
                                                        context)
                                                    ? 20
                                                    : 28,
                                                width: ResponsiveWebSite.isMobile(
                                                        context)
                                                    ? 20
                                                    : 28,
                                                child: Icon(
                                                  Icons.close,
                                                  color: cWhite,
                                                  size: ResponsiveWebSite.isMobile(
                                                          context)
                                                      ? 15
                                                      : 25,
                                                  opticalSize: 10,
                                                ), ////////////////////////////////.................. Close Icon
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), /////////////////////////////////.............Red Container
                                    Expanded(
                                      child: Container(
                                        height: ResponsiveWebSite.isMobile(context)
                                            ? 172
                                            : 150,
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
                                      height: ResponsiveWebSite.isMobile(context)
                                          ? 40
                                          : 60,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        // border: Border(bottom: BorderSide(color: cBlack,width: 0.1),left: BorderSide(color: cBlack,width: 0.1),right: BorderSide(color: cBlack,width: 0.1),),
                                        color: cWhite,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 15,
                                            right: 15),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: ResponsiveWebSite.isMobile(
                                                      context)
                                                  ? 2
                                                  : 4,
                                              child: Container(
                                                height: ResponsiveWebSite.isMobile(
                                                        context)
                                                    ?25
                                                    : 35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: const Color.fromARGB(
                                                      255, 234, 227, 227),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(left: 15),
                                                      child: Icon(
                                                        Icons.forward_to_inbox,
                                                        size: ResponsiveWebSite
                                                                .isMobile(context)
                                                            ? 20
                                                            : 25,
                                                        color: const Color.fromARGB(
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
                                              flex: ResponsiveWebSite.isMobile(
                                                      context)
                                                  ? 1
                                                  : 1,
                                              child: Container(
                                                height: ResponsiveWebSite.isMobile(
                                                        context)
                                                    ? 25
                                                    : 35,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 197, 70, 61),
                                                    borderRadius:
                                                        BorderRadius.circular(3)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(left: 10),
                                                      child: Text(
                                                        "SEND",
                                                        style: TextStyle(
                                                          color: cWhite,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              ResponsiveWebSite
                                                                      .isMobile(
                                                                          context)
                                                                  ? 10
                                                                  : 15,
                                                        ),
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 10),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_circle_right_rounded,
                                                        color: cWhite,
                                                        size: ResponsiveWebSite
                                                                .isMobile(context)
                                                            ? 20
                                                            : 30,
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
                              ),///////////////////////////...................Notice Container
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),///////////////////////////.................Blue Container
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      top:0),
                  child: CircleAvatar(
                    radius: ResponsiveWebSite.isMobile(context) ? 22 : 27,
                    backgroundColor: const Color.fromARGB(255, 141, 14, 5),
                    child: CircleAvatar(
                      radius: ResponsiveWebSite.isMobile(context) ? 19 : 24,
                      backgroundColor: cWhite,
                      child: const Icon(
                        Icons.priority_high,
                        color: cred,
                        size: 30,
                      ),
                    ),
                  ),
                ), //////////////////////////////...........circle avatar
                Padding(
                  padding: EdgeInsets.only(
                    left: ResponsiveWebSite.isMobile(context) ? 10 : 15,
                    top: ResponsiveWebSite.isMobile(context) ? 10 : 15,
                  ),
                  // child: const BackButtonContainerWidget(),
                ),
              ],
            ),
          ],
        ),
      ));
    
  }
}
