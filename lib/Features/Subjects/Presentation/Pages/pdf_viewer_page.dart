import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/pdf_file/pdf_file_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String url;
  final String title;

  const PdfViewerPage({super.key, required this.url, required this.title});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              PdfFileCubit(PdfFileRepoImpl(DioConsumer(Dio())))
                ..loadPdf(widget.url),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
        ),
        body: BlocBuilder<PdfFileCubit, PdfFileState>(
          builder: (context, state) {
            if (state is PdfFileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PdfFileFail) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is PdfViewSuccess) {
              return PdfViewPinch(controller: state.controller);
            } else {
              return Center(child: Text("حالة غير متوقعة"));
            }
          },
        ),
      ),
    );
  }
}
