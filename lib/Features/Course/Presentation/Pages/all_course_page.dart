// import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
// import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
// import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AllCoursePage extends StatelessWidget {
//   final List<CourseAdvModel> resultsList;
//   final AdvPaginationModel paginationModel;
//   const AllCoursePage({
//     super.key,
//     required this.resultsList,
//     required this.paginationModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocBuilder<CourseAdvCubit, CourseAdvState>(
//           builder: (context, state) {
//             final cubit = context.read<CourseAdvCubit>();
//             print(cubit);
//             return Text("cubit.mssg");
//           },
//         ),
//       ),
//     );
//   }
// }
