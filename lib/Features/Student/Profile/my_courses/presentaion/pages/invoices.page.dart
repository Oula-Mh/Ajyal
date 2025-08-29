import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_course_dropdown.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_filter_button.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_header_widget.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/invoices_transaction_card.dart';
import 'package:flutter/material.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  final List<Map<String, dynamic>> coursesData = [
    {
      "id": 1,
      "name": "برمجة بايثون",
      "description": "مقدمة في لغة بايثون للمبتدئين",
      "student_payments": [
        {
          "payment_id": 101,
          "amount": 100,
          "date": "2025-08-01",
          "method": "بطاقة ائتمان",
        },
        {
          "payment_id": 102,
          "amount": 15000000,
          "date": "2025-08-05",
          "method": "تحويل بنكي",
        },
      ],
      "student_dues": [
        {
          "due_id": 201,
          "amount": 200000,
          "due_date": "2025-08-15",
          "status": "غير مدفوع",
        },
      ],
    },
    {
      "id": 2,
      "name": "تصميم واجهات المستخدم",
      "description": "دورة متقدمة في تصميم واجهات المستخدم باستخدام Figma",
      "student_payments": [],
      "student_dues": [
        {
          "due_id": 202,
          "amount": 300,
          "due_date": "2025-08-20",
          "status": "غير مدفوع",
        },
        {
          "due_id": 203,
          "amount": 150,
          "due_date": "2025-09-01",
          "status": "غير مدفوع",
        },
      ],
    },
  ];

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
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> transactions = [];
    double totalPaid = 0;
    double totalDue = 0;

    for (var course in coursesData) {
      if (selectedCourse != "الكل" && course["name"] != selectedCourse)
        continue;

      if (filterType == "الكل" || filterType == "مدفوع") {
        totalPaid += course["student_payments"].fold(
          0,
          (sum, p) => sum + p["amount"],
        );
      }
      if (filterType == "الكل" || filterType == "غير مدفوع") {
        totalDue += course["student_dues"].fold(
          0,
          (sum, d) => sum + d["amount"],
        );
      }

      for (var p in course["student_payments"]) {
        if (filterType == "غير مدفوع") continue;
        transactions.add({
          "type": "مدفوع",
          "course": course["name"],
          "amount": p["amount"],
          "date": p["date"],
          "description": p["method"],
        });
      }
      for (var d in course["student_dues"]) {
        if (filterType == "مدفوع") continue;
        transactions.add({
          "type": "غير مدفوع",
          "course": course["name"],
          "amount": d["amount"],
          "date": d["due_date"],
          "description": "موعد الاستحقاق",
        });
      }
    }
    transactions.sort((a, b) => b["date"].compareTo(a["date"]));

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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Wrap(
                  spacing: 12,
                  children: [
                    FilterButton(
                      label: "الكل",
                      selected: filterType == "الكل",
                      onTap: () => setState(() => filterType = "الكل"),
                    ),
                    FilterButton(
                      label: "مدفوع",
                      selected: filterType == "مدفوع",
                      onTap: () => setState(() => filterType = "مدفوع"),
                    ),
                    FilterButton(
                      label: "غير مدفوع",
                      selected: filterType == "غير مدفوع",
                      onTap: () => setState(() => filterType = "غير مدفوع"),
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
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        )
                        : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            return TransactionCard(
                              transaction: transactions[index],
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
              coursesData: coursesData,
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
  }
}
