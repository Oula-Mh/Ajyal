import 'package:flutter/material.dart';

class NameAndScoreList extends StatelessWidget {
  final dynamic exams;
  const NameAndScoreList({super.key, this.exams});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(exams.length, (index) {
          final exam = exams[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index + 1}. ${exam['name']}'),
                Text(
                  '${exam['score']}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.blueAccent),
                ),
              ],
            ),
          );
        }),
      ],
    );
    // ListView.builder(
    //   shrinkWrap:
    //       true, // Important for nested ListViews in SingleChildScrollView
    //   physics:
    //       const NeverScrollableScrollPhysics(), // Disable scrolling for this list
    //   itemCount: exams.length,
    //   itemBuilder: (context, index) {
    //     final exam = exams[index];
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 8),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text('${index + 1}. ${exam['name']}'),
    //       Text(
    //         '${exam['score']}',
    //         style: Theme.of(
    //           context,
    //         ).textTheme.titleMedium?.copyWith(color: Colors.blueAccent),
    //       ),
    //     ],
    //   ),
    // );
    //   },
    // );
  }
}
