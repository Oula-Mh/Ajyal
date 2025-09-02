import 'dart:typed_data';

import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfx/pdfx.dart';
part 'pdf_file_state.dart';

class PdfFileCubit extends Cubit<PdfFileState> {
  final PdfFileRepo pdfRepo;
  PdfFileCubit(this.pdfRepo) : super(PdfFileInitial());

  PdfFileCubit get(BuildContext context) => BlocProvider.of(context);

  List<PdfFileModel> pdfFiles = [];
  PdfControllerPinch? pdfController;

  Future<void> getSubjectPdfFile(int id) async {
    emit(PdfFileLoading());
    var response = await pdfRepo.getPdfFile(id);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(PdfFileFail(errMessage: err.errorMessage)),
      (model) => emit(PdfFileSuccess(model: model)),
    );
  }

  Future<void> loadPdf(String url) async {
    emit(PdfFileLoading());
    try {
      final ByteData data = await NetworkAssetBundle(Uri.parse(url)).load(url);
      final Uint8List bytes = data.buffer.asUint8List();

      pdfController = PdfControllerPinch(document: PdfDocument.openData(bytes));

      emit(PdfViewSuccess(pdfController!));
    } catch (e) {
      emit(
        PdfFileFail(
          errMessage: "فشل في تحميل الملف. تأكد من الاتصال بالإنترنت.",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    pdfController?.dispose();
    return super.close();
  }
}
