import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PdfFileRepoImpl implements PdfFileRepo {
  final Api api;

  PdfFileRepoImpl(this.api);

  @override
  Future<Either<Failure, List<PdfFileModel>>> getPdfFile(
    int curriculaId,
  ) async {
    try {
      final response = await api.get(EndPoints.pdf + curriculaId.toString());
      final subjects = response['data']['files'];
      final List<PdfFileModel> subjectList =
          (subjects as List)
              .map((json) => PdfFileModel.fromJson(json))
              .toList();
      return Right(subjectList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  // try {
  //   // قائمة تجريبية
  //   final List<Map<String, String>> pdfFiles = [
  //     {
  //       'title': 'رياضيات',
  //       'url':
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //     },
  //     {
  //       'title': 'ملف تعليمي ',
  //       'url':
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //     },
  //     {
  //       'title': 'ملف تعليمي - رياضيات',
  //       'url':
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //     },
  //     {
  //       'title': 'something',
  //       'url':
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //     },
  //     {
  //       'title': 'title',
  //       'url':
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
  //     },
  //   ];

  // تحويل القائمة إلى List<PdfFileModel>
  //   final List<PdfFileModel> pdfList =
  //       pdfFiles
  //           .asMap()
  //           .entries
  //           .map(
  //             (entry) => PdfFileModel(
  //               id: entry.key + 1, // استخدام رقم تسلسلي مؤقت
  //               title: entry.value['title']!,
  //               filePath: entry.value['url']!,
  //             ),
  //           )
  //           .toList();

  //   return Right(pdfList);
  // } catch (e) {
  //   return Left(ServerFailure(e.toString()));
  // }
}

  // @override
  // Future<Either<Failure, List<PdfFileModel>>> getPdfFile() async {
  //   try {
  //     final response = await api.get(EndPoints.pdf);
  //     print(response);
  //     print("pdf file list!!\n");

  //     // تأكد أن الاستجابة تحتوي على قائمة من العناصر داخل المفتاح "data"
  //     final List data = response['data'];

  //     final List<PdfFileModel> pdfList =
  //         data
  //             .map(
  //               (item) => PdfFileModel.fromJson(item as Map<String, dynamic>),
  //             )
  //             .toList();

  //     print("\n$pdfList===========😍\n");
  //     return Right(pdfList);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

