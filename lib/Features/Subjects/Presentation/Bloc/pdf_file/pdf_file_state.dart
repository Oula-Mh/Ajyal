part of 'pdf_file_cubit.dart';

sealed class PdfFileState {}

final class PdfFileInitial extends PdfFileState {}

final class PdfFileLoading extends PdfFileState {}

final class PdfFileSuccess extends PdfFileState {
  final List<PdfFileModel> model;

  PdfFileSuccess({required this.model});
}

final class PdfFileFail extends PdfFileState {
  final String errMessage;

  PdfFileFail({required this.errMessage});
}
