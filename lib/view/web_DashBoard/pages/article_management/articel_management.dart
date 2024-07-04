import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/article_management/createArticle.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/article_management/edit_delete.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/staff_management/widget/headerText_widget.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
      color: cGrey.withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: GooglePoppinsWidgets(
                          text: 'ARTICLE DETAILS',
                          fontsize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          createArticle(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: cBlue),
                          height: 40,
                          width: 140,
                          child: Center(
                            child: GooglePoppinsWidgets(
                              text: 'Create Article',
                              fontsize: 12,
                              color: cWhite,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color: cWhite,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          border: Border.all(color: cGrey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: HeaderRowTextWidget(
                              title: 'No',
                            ),
                          ),
                          HeaderRowTextWidget(
                            title: 'Article Name',
                          ),
                          HeaderRowTextWidget(
                            title: 'Article Description',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: HeaderRowTextWidget(
                              title: 'Article Link',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('ArticleManagement')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GestureDetector(
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final snap =
                                            snapshot.data!.docs[index].data();
                                        return GestureDetector(
                                          onTap: () {
                                            articleEditAndDelete(
                                                context,
                                                snap['articleTitle'],
                                                snap['articleDescription'],
                                                snap['docID']);
                                          },
                                          child: SizedBox(
                                            height: 200,
                                            child: ListView(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            8,
                                                        child: HeaderRowTextWidget(
                                                            title:
                                                                '${index + 1}'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      child:
                                                          GooglePoppinsWidgets(
                                                        text: snap[
                                                            'articleTitle'],
                                                        fontsize: 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      child:
                                                          GooglePoppinsWidgets(
                                                        text: snap[
                                                            'articleDescription'],
                                                        fontsize: 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              8,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            launch(snap[
                                                                'articleUrl']);
                                                          },
                                                          child: (isHovered ==
                                                                  false)
                                                              ? GooglePoppinsWidgets(
                                                                  text: snap[
                                                                      'articleUrl'],
                                                                  fontsize: 14,
                                                                )
                                                              : GooglePoppinsWidgets(
                                                                  text: snap[
                                                                      'articleUrl'],
                                                                  fontsize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Colors.grey,
                                                  thickness: 2.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }
                              return const SizedBox();
                            }))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
