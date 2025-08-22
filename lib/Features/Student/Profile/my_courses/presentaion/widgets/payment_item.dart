import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentItem extends StatelessWidget {
  final double amount;
  final DateTime dueDate;
  final bool isPayable;
  final VoidCallback onPay;

  const PaymentItem({
    super.key,
    required this.amount,
    required this.dueDate,
    required this.isPayable,
    required this.onPay,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Card(
      color: AppColor.white1,
      elevation: 1,
      margin: const EdgeInsets.only(top: 21, right: 12, left: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // الأيقونة
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 229, 246),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.receipt_long,
                color: AppColor.primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),

            // تفاصيل المبلغ
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المبلغ المطلوب",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${amount.toStringAsFixed(2)} ل.س",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "آخر موعد: ${dateFormat.format(dueDate)}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),

            // زر الدفع
            ElevatedButton(
              onPressed: isPayable ? onPay : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isPayable ? Colors.green : Colors.grey.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("دفع", style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
