import 'package:ajyal/Features/Student/Profile/my_courses/data/models/unpaid_invoice_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/unPaid_invoices/unPaid_invoices_cubit.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/unPaid_invoices_card.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/unPaid_invoices_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnpaidInvoicesBody extends StatelessWidget {
  final void Function(UnpaidInvoicesModel invoice) onPayInvoice;

  const UnpaidInvoicesBody({required this.onPayInvoice, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnPaidInvoicesCubit, UnPaidInvoicesState>(
      builder: (context, state) {
        if (state is UnPaidInvoicesLoading) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return UnPaidInvoicesCardShimmer();
            },
          );
        } else if (state is UnPaidInvoicesFailure) {
          return Center(
            child: Text(
              "حدث خطأ: ${state.errMsg}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        } else if (state is UnPaidInvoicesSuccess) {
          final invoices = state.unpaidInvoicesModel;

          if (invoices.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد مدفوعات حالياً ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              final invoice = invoices[index];
              return UnPaidInvoicesCard(
                amount: double.parse(invoice.value),
                dueDate: DateTime.parse(invoice.dueDate),
                // numInvoices: index,
                isPayable: index == 0 + 1,
                onPay: () => onPayInvoice,
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
