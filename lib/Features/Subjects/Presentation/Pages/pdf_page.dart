import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Subjects/Data/model/pdf_file_model.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/pdf_file/pdf_file_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/search/search_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/pdf_filter_list.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/subject_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
        title: Text('قائمة ملفات PDF', style: TextStyle(color: Colors.white)),
      ),
      body: BlocConsumer<PdfFileCubit, PdfFileState>(
        listener: (context, state) {
          if (state is PdfFileSuccess) {
            context.read<SearchCubit>().setList(state.model);
          }
        },
        builder: (context, state) {
          if (state is PdfFileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PdfFileFail) {
            return Center(child: Text("حدث خطأ: ${state.errMessage}"));
          } else if (state is PdfFileSuccess) {
            return Column(
              children: [
                //  Search Bar
                SubjectSearchWidget(
                  onChanged: (value) {
                    context.read<SearchCubit>().search(value);
                  },
                ),

                //  Filtered List
                Expanded(
                  child: BlocBuilder<SearchCubit, List<PdfFileModel>>(
                    builder: (context, filteredList) {
                      return PdfFilteredList(filteredList: filteredList);
                    },
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
