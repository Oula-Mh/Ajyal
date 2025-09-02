import 'package:flutter/material.dart';

// class CourseDropdown extends StatelessWidget {
//   final List<Map<String, dynamic>> coursesData;
//   final String selectedCourse;
//   final double top;
//   final double left;
//   final Function(String) onSelect;

//   const CourseDropdown({
//     super.key,
//     required this.coursesData,
//     required this.selectedCourse,
//     required this.top,
//     required this.left,
//     required this.onSelect,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: top,
//       left: left,
//       child: Material(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         elevation: 5,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             for (var name in ["الكل", ...coursesData.map((c) => c["name"])])
//               InkWell(
//                 onTap: () => onSelect(name.toString()),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 10,
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(name.toString()),
//                       if (name == selectedCourse)
//                         const Padding(
//                           padding: EdgeInsets.only(right: 5),
//                           child: Icon(
//                             Icons.check,
//                             color: Colors.blue,
//                             size: 18,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class CourseDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> coursesData;
  final String selectedCourse;
  final double top;
  final double left;
  final Function(String) onSelect;

  const CourseDropdown({
    super.key,
    required this.coursesData,
    required this.selectedCourse,
    required this.top,
    required this.left,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var name in ["الكل", ...coursesData.map((c) => c["name"])])
              InkWell(
                onTap: () => onSelect(name.toString()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(name.toString()),
                      if (name == selectedCourse)
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.check,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
