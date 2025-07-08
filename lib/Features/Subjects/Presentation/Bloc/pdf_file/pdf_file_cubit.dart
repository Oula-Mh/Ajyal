import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pdf_file_state.dart';

class PdfFileCubit extends Cubit<PdfFileState> {
  final PdfFileRepo pdfRepo;
  PdfFileCubit(this.pdfRepo) : super(PdfFileInitial());

  PdfFileCubit get(BuildContext context) => BlocProvider.of(context);

  // final List<Map<String, String>> pdfFiles = [
  //   {
  //     'title': 'رياضيات',
  //     'url':
  //         'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //   },
  //   {
  //     'title': 'ملف تعليمي ',
  //     'url':
  //         'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //   },
  //   {
  //     'title': 'ملف تعليمي - رياضيات',
  //     'url':
  //         'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //   },
  //   {
  //     'title': 'something',
  //     'url':
  //         'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //   },
  //   {
  //     'title': 'title',
  //     'url':
  //         'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //   },
  // ];
  List<PdfFileModel> pdfFiles = [];

  Future<void> getPdfFile(int id) async {
    emit(PdfFileLoading());
    var response = await pdfRepo.getPdfFile(id);
    response.fold(
      (err) => emit(PdfFileFail(errMessage: err.errorMessage)),
      (model) => emit(PdfFileSuccess(model: model)),
    );
  }
}
