import 'package:ajyal/Features/Subjects/Presentation/Pages/pdf_viewer_page.dart';
import 'package:flutter/material.dart';

class PdfPage extends StatelessWidget {
  final List<Map<String, String>> pdfFiles = [
    {
      'title': 'ملف تعليمي - رياضيات',
      'url':
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    },
    {
      'title': 'ملف تعليمي - رياضيات',
      'url':
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    },
    {
      'title': 'ملف تعليمي - رياضيات',
      'url':
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
    },
  ];

  PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('قائمة ملفات PDF')),
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          final file = pdfFiles[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Text(file['title']!),
                subtitle: Text(file['url']!),
                leading: Icon(Icons.picture_as_pdf, color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PdfViewerPage(url: file['url']!),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
