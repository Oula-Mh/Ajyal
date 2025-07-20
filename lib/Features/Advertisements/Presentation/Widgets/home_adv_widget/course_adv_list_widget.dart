// import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_adv/course_adv_cubit.dart';
// import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_list.dart';
// import 'package:ajyal/Features/Home/Presentation/Widgets/course_adv_skelton.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CourseAdvList extends StatelessWidget {
//   const CourseAdvList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CourseAdvCubit, CourseAdvState>(
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Text(
//             //       "الكورسات المتاحة",
//             //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             //     ),
//             //     if (state is CourseAdvSuccess)
//             //       ViewAllAdv(
//             //         router: AppRouter.allCoursePage,
//             //         params: {
//             //           'resultsList': state.model.data,
//             //           'paginationModel': state.model,
//             //         },
//             //         viewText: "عرض الكل",
//             //       ),
//             //   ],
//             // ),
//             state is CourseAdvSuccess
//                 ? CourseAdvListView(mylist: state.model.data!)
//                 : SizedBox(
//                   height: 275,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 2,
//                     itemBuilder: (context, index) {
//                       return const CourseAdvShimmer();
//                     },
//                   ),
//                 ),
//           ],
//         );
//       },
//     );
//   }
// }
