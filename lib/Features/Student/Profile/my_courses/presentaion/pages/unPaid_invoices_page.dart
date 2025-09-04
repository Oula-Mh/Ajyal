// import 'package:ajyal/Core/styles/app_color.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/unPaid_invoices/unPaid_invoices_cubit.dart';
// import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/payment_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UnPaidInvoicesPage extends StatefulWidget {
//   const UnPaidInvoicesPage({super.key});

//   @override
//   State<UnPaidInvoicesPage> createState() => _UnPaidInvoicesPageState();
// }

// class _UnPaidInvoicesPageState extends State<UnPaidInvoicesPage> {
//   List<Map<String, dynamic>> payments = [
//     {"amount": 50000.0, "dueDate": DateTime(2025, 8, 15)},
//     {"amount": 45000.0, "dueDate": DateTime(2025, 9, 10)},
//     {"amount": 30000.0, "dueDate": DateTime(2025, 10, 5)},
//   ];

//   void _payFirst() async {
//     final paid = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const PaymentProcessPage()),
//     );

//     if (paid == true) {
//       setState(() {
//         payments.removeAt(0);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     context.read<UnPaidInvoicesCubit>().getunPaidInvoices(
//       idStdent: 1,
//       idCourse: 1,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "تسديد الدفعات",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColor.primaryColor,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body:
//           payments.isEmpty
//               ? const Center(
//                 child: Text(
//                   "لا يوجد مدفوعات حالياً 🎉",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               )
//               : ListView.builder(
//                 itemCount: payments.length,
//                 itemBuilder: (context, index) {
//                   final payment = payments[index];
//                   return PaymentItem(
//                     amount: payment["amount"],
//                     dueDate: payment["dueDate"],
//                     isPayable: index == 0,
//                     onPay: _payFirst,
//                   );
//                 },
//               ),
//     );
//   }
// }

// // ✅ صفحة عملية الدفع
// class PaymentProcessPage extends StatelessWidget {
//   const PaymentProcessPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: const Text("عملية الدفع"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: ElevatedButton.icon(
//           icon: const Icon(Icons.check_circle),
//           label: const Text("تأكيد الدفع", style: TextStyle(fontSize: 16)),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.green,
//             foregroundColor: Colors.white,
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/unpaid_invoice_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/unPaid_invoices/unPaid_invoices_cubit.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/unPaid_invoices_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnPaidInvoicesPage extends StatefulWidget {
  UnPaidInvoicesPage({required this.idCourse, super.key});
  int idCourse;

  @override
  State<UnPaidInvoicesPage> createState() => _UnPaidInvoicesPageState();
}

class _UnPaidInvoicesPageState extends State<UnPaidInvoicesPage> {
  @override
  void initState() {
    super.initState();
    context.read<UnPaidInvoicesCubit>().getunPaidInvoices(
      idStdent: int.parse(getit<CacheHelper>().getData(key: "studentIdbase")),
      idCourse: widget.idCourse,
    );
  }

  void _payFirst(UnpaidInvoicesModel invoice) async {
    final paid = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PaymentProcessPage()),
    );

    if (paid == true) {
      context.read<UnPaidInvoicesCubit>().getunPaidInvoices(
        idStdent: 1,
        idCourse: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "تسديد الدفعات",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: UnpaidInvoicesBody(onPayInvoice: (invoice) => _payFirst),
    );
  }
}

// ✅ صفحة عملية الدفع
class PaymentProcessPage extends StatelessWidget {
  const PaymentProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("عملية الدفع"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.check_circle),
          label: const Text("تأكيد الدفع", style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}
