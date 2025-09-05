// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/options_list_pre.dart';
// import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
// import 'package:flutter/material.dart';

// class QuestionCardPre extends StatelessWidget {
//   final QuestionPreModel mainQuestion;
//   final QuestionPreModel subQuestion;

//   const QuestionCardPre({
//     super.key,
//     required this.mainQuestion,
//     required this.subQuestion,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(25.0),
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 236, 242, 250),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (mainQuestion.questionText.isNotEmpty) ...[
//                 Text(
//                   mainQuestion.questionText,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//               ],
//               if (mainQuestion.image != null) ...[
//                 const SizedBox(height: 12),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder:
//                             (_) => Dialog(
//                               child: InteractiveViewer(
//                                 child: Image.network(mainQuestion.image!),
//                               ),
//                             ),
//                       );
//                     },
//                     child: Image.network(
//                       mainQuestion.image!,
//                       height: 140,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ],
//               if (mainQuestion.questionText.isNotEmpty &&
//                   mainQuestion.id != subQuestion.id) ...[
//                 Divider(
//                   height: 30,
//                   thickness: 1.5,
//                   color: Colors.grey.shade300,
//                 ),
//               ],
//               if (subQuestion.questionText.isNotEmpty &&
//                   mainQuestion.id != subQuestion.id) ...[
//                 Text(
//                   subQuestion.questionText,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black45,
//                   ),
//                 ),
//               ],

//               const SizedBox(height: 16),
//               OptionsListPre(subQuestion: subQuestion),
//               const SizedBox(height: 20),
//               if (subQuestion.hint.isNotEmpty)
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 249, 246, 223),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.lightbulb, color: Colors.orange, size: 26),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           subQuestion.hint,
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/options_list_pre.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class QuestionCardPre extends StatelessWidget {
  final QuestionPreModel mainQuestion;
  final QuestionPreModel subQuestion;

  const QuestionCardPre({
    super.key,
    required this.mainQuestion,
    required this.subQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 242, 250),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mainQuestion.questionText.isNotEmpty) ...[
                Text(
                  mainQuestion.questionText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              if (mainQuestion.image != null) ...[
                const SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => Dialog(
                              child: InteractiveViewer(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      EndPoints.fileBaseUrl +
                                      mainQuestion.image!,
                                  fit: BoxFit.contain,
                                  placeholder:
                                      (context, url) => Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) => const Icon(
                                        Icons.error,
                                        size: 40,
                                        color: Colors.blueGrey,
                                      ),
                                ),
                              ),
                            ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: EndPoints.fileBaseUrl + mainQuestion.image!,
                      height: 140,
                      fit: BoxFit.contain,
                      placeholder:
                          (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => const Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.blueGrey,
                          ),
                    ),
                  ),
                ),
              ],
              if (mainQuestion.questionText.isNotEmpty &&
                  mainQuestion.id != subQuestion.id) ...[
                Divider(
                  height: 30,
                  thickness: 1.5,
                  color: Colors.grey.shade300,
                ),
              ],
              if (subQuestion.questionText.isNotEmpty &&
                  mainQuestion.id != subQuestion.id) ...[
                Text(
                  subQuestion.questionText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              OptionsListPre(subQuestion: subQuestion),
              const SizedBox(height: 20),
              if (subQuestion.hint != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 246, 223),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lightbulb,
                        color: Colors.orange,
                        size: 26,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          subQuestion.hint!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
