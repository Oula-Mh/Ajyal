import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/model/pdf_file_model.dart';

class SearchCubit extends Cubit<List<PdfFileModel>> {
  final List<PdfFileModel> originalList;

  SearchCubit(this.originalList) : super(originalList);

  void search(String query) {
    if (query.isEmpty) {
      emit(originalList);
    } else {
      final filtered =
          originalList.where((item) {
            return item.title.toLowerCase().contains(query.toLowerCase());
          }).toList();
      emit(filtered);
    }
  }

  void setList(List<PdfFileModel> newList) {
    emit(newList);
    originalList.clear();
    originalList.addAll(newList);
  }
}
