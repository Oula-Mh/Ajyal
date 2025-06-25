import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/pdf_viewer_page.dart';
import 'package:flutter/material.dart';

class PdfFilteredList extends StatelessWidget {
  final List<PdfFileModel> filteredList;
  const PdfFilteredList({super.key, required this.filteredList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final file = filteredList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),

              child: ListTile(
                title: Text(
                  file.title,
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
                ),
                subtitle: Text("34 MB", style: TextStyle(color: Colors.grey)),
                leading: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                    size: 27,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => PdfViewerPage(
                            url: file.filePath,
                            title: file.title,
                          ),
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
