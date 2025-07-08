import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:dartz/dartz.dart';

abstract class PdfFileRepo {
  Future<Either<Failure, List<PdfFileModel>>> getPdfFile(int curriculaId);
}
