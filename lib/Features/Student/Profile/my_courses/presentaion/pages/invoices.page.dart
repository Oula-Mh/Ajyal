// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/invoices/invoices_cubit.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_course_dropdown.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_filter_button.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_header_widget.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_transaction_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class InvoicesPage extends StatefulWidget {
//   const InvoicesPage({super.key});

//   @override
//   State<InvoicesPage> createState() => _InvoicesPageState();
// }

// class _InvoicesPageState extends State<InvoicesPage> {
//   String selectedCourse = "الكل";
//   String filterType = "الكل";
//   bool showDropdown = false;
//   final GlobalKey _filterKey = GlobalKey();
//   double dropdownTop = 0;
//   double dropdownLeft = 0;

//   void toggleDropdown() {
//     if (showDropdown) {
//       setState(() => showDropdown = false);
//     } else {
//       setState(() => showDropdown = true);
//       final RenderBox renderBox =
//           _filterKey.currentContext!.findRenderObject() as RenderBox;
//       final position = renderBox.localToGlobal(Offset.zero);
//       dropdownTop = position.dy + renderBox.size.height;
//       dropdownLeft = position.dx;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // جلب البيانات أول ما تفتح الصفحة
//     context.read<InvoicesCubit>().getinvoices(idStudent: 1); // حط id الطالب
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<InvoicesCubit, InvoicesState>(
//       builder: (context, state) {
//         if (state is InvoicesLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is InvoicesFailure) {
//           return Center(child: Text("خطأ: ${state.errMsg}"));
//         } else if (state is InvoicesSuccess) {
//           final coursesData = state.invoicesModel.data; // ✅ البيانات من الباك

//           List<Map<String, dynamic>> transactions = [];
//           double totalPaid = 0;
//           double totalDue = 0;

//           for (var courseData in coursesData) {
//             final course = courseData.course;

//             if (selectedCourse != "الكل" && course.name != selectedCourse) {
//               continue;
//             }

//             // الفواتير المدفوعة
//             if (filterType == "الكل" || filterType == "مدفوع") {
//               for (var invoice in courseData.paidInvoices) {
//                 for (var p in invoice.payments) {
//                   totalPaid += double.parse(invoice.value);
//                   transactions.add({
//                     "type": "مدفوع",
//                     "course": course.name,
//                     "amount": invoice.value,
//                     "date": p.paymentDate,
//                     "description": "مدفوع (${p.paymentDate})",
//                   });
//                 }
//               }
//             }

//             // الفواتير غير المدفوعة
//             if (filterType == "الكل" || filterType == "غير مدفوع") {
//               for (var invoice in courseData.unpaidInvoices) {
//                 totalDue += double.parse(invoice.value);
//                 transactions.add({
//                   "type": "غير مدفوع",
//                   "course": course.name,
//                   "amount": invoice.value,
//                   "date": invoice.dueDate,
//                   "description": "موعد الاستحقاق",
//                 });
//               }
//             }
//           }

//           // ترتيب حسب التاريخ
//           // transactions.sort((a, b) => b["date"].compareTo(a["date"]));

//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: Stack(
//               children: [
//                 Column(
//                   children: [
//                     HeaderWidget(
//                       totalPaid: totalPaid,
//                       totalDue: totalDue,
//                       selectedCourse: selectedCourse,
//                       filterType: filterType,
//                       filterKey: _filterKey,
//                       onFilterTap: toggleDropdown,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 15,
//                         vertical: 8,
//                       ),
//                       child: Wrap(
//                         spacing: 12,
//                         children: [
//                           FilterButton(
//                             label: "الكل",
//                             selected: filterType == "الكل",
//                             onTap: () => setState(() => filterType = "الكل"),
//                           ),
//                           FilterButton(
//                             label: "مدفوع",
//                             selected: filterType == "مدفوع",
//                             onTap: () => setState(() => filterType = "مدفوع"),
//                           ),
//                           FilterButton(
//                             label: "غير مدفوع",
//                             selected: filterType == "غير مدفوع",
//                             onTap:
//                                 () => setState(() => filterType = "غير مدفوع"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child:
//                           transactions.isEmpty
//                               ? Center(
//                                 child: Text(
//                                   "لا توجد بيانات للعرض",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey.shade600,
//                                   ),
//                                 ),
//                               )
//                               : ListView.builder(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 15,
//                                 ),
//                                 itemCount: transactions.length,
//                                 itemBuilder: (context, index) {
//                                   return TransactionCard(
//                                     transaction: transactions[index],
//                                   );
//                                 },
//                               ),
//                     ),
//                   ],
//                 ),
//                 if (showDropdown)
//                   Positioned.fill(
//                     child: GestureDetector(
//                       onTap: toggleDropdown,
//                       child: Container(color: Colors.transparent),
//                     ),
//                   ),
//                 if (showDropdown)
//                   CourseDropdown(
//                     coursesData:
//                         coursesData
//                             .map((c) => {"name": c.course.name})
//                             .toList(), // ✅ تحويل لواجهة
//                     selectedCourse: selectedCourse,
//                     top: dropdownTop,
//                     left: dropdownLeft,
//                     onSelect: (name) {
//                       setState(() {
//                         selectedCourse = name;
//                         showDropdown = false;
//                       });
//                     },
//                   ),
//               ],
//             ),
//           );
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }
// }
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/invoices/invoices_cubit.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_course_dropdown.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_filter_button.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_header_widget.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_shimmer.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class InvoicesPage extends StatefulWidget {
  InvoicesPage({required this.idStudent, super.key});
  int idStudent;

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  String selectedCourse = "الكل";
  String filterType = "الكل";
  bool showDropdown = false;
  final GlobalKey _filterKey = GlobalKey();
  double dropdownTop = 0;
  double dropdownLeft = 0;

  void toggleDropdown() {
    if (showDropdown) {
      setState(() => showDropdown = false);
    } else {
      setState(() => showDropdown = true);
      final RenderBox renderBox =
          _filterKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      dropdownTop = position.dy + renderBox.size.height;
      dropdownLeft = position.dx;
    }
  }

  @override
  void initState() {
    super.initState();
    // جلب البيانات أول ما تفتح الصفحة
    context.read<InvoicesCubit>().getinvoices(
      idStudent: widget.idStudent,
    ); // حط id الطالب
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = screenWidth / 375; // أساس 375px (iPhone 11 تقريباً)
    return BlocBuilder<InvoicesCubit, InvoicesState>(
      builder: (context, state) {
        if (state is InvoicesLoading) {
          return InvoicesShimmer(
            textScale: textScale,
          ); // Shimmer ضمن Scaffold كامل
        } else if (state is InvoicesFailure) {
          return Scaffold(body: Center(child: Text("خطأ: ${state.errMsg}")));
        } else if (state is InvoicesSuccess) {
          final coursesData = state.invoicesModel.data; // ✅ البيانات من الباك

          List<Map<String, dynamic>> transactions = [];
          double totalPaid = 0;
          double totalDue = 0;

          for (var courseData in coursesData) {
            final course = courseData.course;

            if (selectedCourse != "الكل" && course.name != selectedCourse) {
              continue;
            }

            // الفواتير المدفوعة
            if (filterType == "الكل" || filterType == "مدفوع") {
              for (var invoice in courseData.paidInvoices) {
                for (var p in invoice.payments) {
                  totalPaid += double.parse(invoice.value);
                  transactions.add({
                    "type": "مدفوع",
                    "course": course.name,
                    "amount": invoice.value,
                    "date": p.paymentDate,
                    "description": "مدفوع (${p.paymentDate})",
                  });
                }
              }
            }

            // الفواتير غير المدفوعة
            if (filterType == "الكل" || filterType == "غير مدفوع") {
              for (var invoice in courseData.unpaidInvoices) {
                totalDue += double.parse(invoice.value);
                transactions.add({
                  "type": "غير مدفوع",
                  "course": course.name,
                  "amount": invoice.value,
                  "date": invoice.dueDate,
                  "description": "موعد الاستحقاق",
                });
              }
            }
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(
                      totalPaid: totalPaid,
                      totalDue: totalDue,
                      selectedCourse: selectedCourse,
                      filterType: filterType,
                      filterKey: _filterKey,
                      onFilterTap: toggleDropdown,
                      textScale: textScale,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenWidth * 0.02,
                      ),
                      child: Wrap(
                        spacing: 12,
                        children: [
                          FilterButton(
                            label: "الكل",
                            selected: filterType == "الكل",
                            onTap: () => setState(() => filterType = "الكل"),
                            textScale: textScale,
                          ),
                          FilterButton(
                            label: "مدفوع",
                            selected: filterType == "مدفوع",
                            onTap: () => setState(() => filterType = "مدفوع"),
                            textScale: textScale,
                          ),
                          FilterButton(
                            label: "غير مدفوع",
                            selected: filterType == "غير مدفوع",
                            onTap:
                                () => setState(() => filterType = "غير مدفوع"),
                            textScale: textScale,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          transactions.isEmpty
                              ? Center(
                                child: Text(
                                  "لا توجد بيانات للعرض",
                                  style: TextStyle(
                                    fontSize: 14 * textScale,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              )
                              : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                ),
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  return TransactionCard(
                                    transaction: transactions[index],
                                    textScale: textScale,
                                  );
                                },
                              ),
                    ),
                  ],
                ),
                if (showDropdown)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: toggleDropdown,
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                if (showDropdown)
                  CourseDropdown(
                    coursesData:
                        coursesData
                            .map((c) => {"name": c.course.name})
                            .toList(), // ✅ تحويل لواجهة
                    selectedCourse: selectedCourse,
                    top: dropdownTop,
                    left: dropdownLeft,
                    onSelect: (name) {
                      setState(() {
                        selectedCourse = name;
                        showDropdown = false;
                      });
                    },
                  ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
