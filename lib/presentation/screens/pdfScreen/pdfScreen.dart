
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  bool _isLoading = true;
  String? _localFilePath;
  final String pdfUrl = 'http://mostafatolba-001-site1.etempurl.com/Files/Lessons//C1XCF93T21_englishgrammarbook.pdf';
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Future<void> _downloadFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/myPDF.pdf'; // Choose your desired file name

    final response = await http.get(Uri.parse(pdfUrl));

    if (response.statusCode == 200) {
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        _isLoading = false;
        _localFilePath = filePath;
      });
    } else {
      throw Exception('Failed to download PDF');
    }
  }

  @override
  void initState() {
    _downloadFile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.buttonColor,
        title: const Text('PDF Viewer'),
      ),
      body:_isLoading
          ? const Center(child: CircularProgressIndicator())
          :PDFView(
        filePath: _localFilePath ?? '',
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },

      ),
    );
  }
}
