import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
