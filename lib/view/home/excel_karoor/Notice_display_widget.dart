import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/google_monstre.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class ExcelKaroorNoticedisplay extends StatelessWidget {
  const ExcelKaroorNoticedisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        color: excelkaroorThemeColor.withOpacity(0.1),
        height: ResponsiveWebSite.isMobile(context)
            ? 350
            : 550, // Adjust the height of the containers as needed
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GooglePoppinsWidgets(
                text: 'OUR ARTICLES',
                fontsize: 25,
                fontWeight: FontWeight.w800,
                color: excelkaroorThemeColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // StreamBuilder(
            //     stream: FirebaseFirestore.instance
            //         .collection('ArticleManagement')
            //         .snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return Expanded(
            //           child: ListView.builder(
            //               scrollDirection: Axis.horizontal,
            //               itemCount: snapshot.data!.docs.length,
            //               itemBuilder: (context, index) {
            //                 return
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             ArticleView(
                    //                 url: snapshot.data!
                    //                         .docs[index]
                    //                     ['articleUrl'])));
                  },
                  child: Container(
                      margin: const EdgeInsets.all(8.0),
                      width: ResponsiveWebSite.isMobile(context)
                          ? 200
                          : 400, // Adjust the width of each container as needed
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                            'webassets/excel_karror/excel_karoor_logo.png'),
                      )),
                ),
                GoogleMonstserratWidgets(
                  text: "EXCELKAROOR",
                  //"snapshot.data!.docs[index]",
                  //['articleTitle'],
                  fontsize: 15,
                  fontWeight: FontWeight.w500,
                  color: excelkaroorThemeColor,
                ),
              ],
            )
// ////////////////////////////////////////////////////////////////////////////////////////////
//                                 }),
//                           );
//                         } else {
//                           return const Text('');
//                         }
//                       }),///
          ],
        ),
      ),
    );
  }
}

class ArticleView extends StatelessWidget {
  ArticleView({super.key, required this.url});
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

//  PdfViewerController rg = PdfViewerController();
  final String url;
  @override
  Widget build(BuildContext context) {
    _pdfViewerKey.currentState?.openBookmarkView();
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializePDF(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SfPdfViewer.network(
              url,
              key: _pdfViewerKey,
              // initialScrollOffset: const Offset(0, 500),
              controller: _pdfViewerController,
              onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                print('PDF load failed: ${details.error}');
                print('Description: ${details.description}');
              },
              // pageSpacing: 2,
              // initialZoomLevel: 1.5,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading PDF: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _initializePDF() async {
    // You can add any necessary initialization logic here
    // For example, loading necessary data or configurations.
    // This function should return a Future to indicate when it's done.
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating some initialization delay.
  }
}
