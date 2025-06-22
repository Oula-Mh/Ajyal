import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show NetworkAssetBundle;
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String url;

  const PdfViewerPage({super.key, required this.url});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfControllerPinch _pdfController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPdfFromNetwork();
  }

  Future<void> _loadPdfFromNetwork() async {
    try {
      final ByteData data = await NetworkAssetBundle(
        Uri.parse(widget.url),
      ).load(widget.url);
      final Uint8List bytes = data.buffer.asUint8List();

      _pdfController = PdfControllerPinch(
        document: PdfDocument.openData(bytes),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("فشل في تحميل الملف: $e");
    }
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('عرض ملف PDF')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : PdfViewPinch(controller: _pdfController),
    );
  }
}
