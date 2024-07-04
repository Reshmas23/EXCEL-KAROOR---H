import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_monstre.dart';
import 'package:vidyaveechi_website/view/home/excel_karoor/Notice_display_widget.dart';
class ArticleDisplayPage extends StatelessWidget {
  const ArticleDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlack.withOpacity(0.9),
      appBar: AppBar(
        title: GoogleMonstserratWidgets(
          text: 'Articles',
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ArticleManagement')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.data == null) {
              return Center(
                child: GoogleMonstserratWidgets(
                  text: 'No data',
                  color: Colors.white,
                  fontsize: 16,
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    // child: ListTile(
                    //     leading: Container(
                    //   color: Colors.white,
                    //   width: 200,
                    //   height: 200,
                    //   child: Column(
                    //     children: [
                    //       Image.asset('assests/images/advo_logo_new.png'),
                    //       GoogleMonstserratWidgets(
                    //         text: 'Articles',
                    //         fontsize: 15,
                    //         fontWeight: FontWeight.bold,
                    //       )
                    //     ],
                    //   ),
                    // )),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.white,
                            width: 200,
                            height: 230,
                            child: Column(
                              children: [
                                Image.asset('assests/images/advo_logo_new.png'),
                                GoogleMonstserratWidgets(
                                  text: 'Articles',
                                  fontsize: 15,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GoogleMonstserratWidgets(
                                    text: snapshot.data!.docs[index]
                                        ['articleTitle'],
                                    fontsize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    snapshot.data!.docs[index]
                                        ['articleDescription'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ArticleView(
                                                  url:
                                                      snapshot.data!.docs[index]
                                                          ['articleUrl'])));
                                    },
                                    child: GoogleMonstserratWidgets(
                                      text: 'View Article',
                                      fontsize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
