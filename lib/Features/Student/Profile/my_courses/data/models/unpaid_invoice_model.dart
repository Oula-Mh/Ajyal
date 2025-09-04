// class UnpaidInvoicesModel {
//   final String message;
//   final UnpaidInvoicesData data;
//   final int code;

//   UnpaidInvoicesModel({
//     required this.message,
//     required this.data,
//     required this.code,
//   });

//   factory UnpaidInvoicesModel.fromJson(Map<String, dynamic> json) {
//     return UnpaidInvoicesModel(
//       message: json['message'],
//       data: UnpaidInvoicesData.fromJson(json['data']),
//       code: json['code'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'message': message, 'data': data.toJson(), 'code': code};
//   }
// }

// class UnpaidInvoicesData {
//   final String message;
//   final List<Invoice> unpaidInvoices;

//   UnpaidInvoicesData({required this.message, required this.unpaidInvoices});

//   factory UnpaidInvoicesData.fromJson(Map<String, dynamic> json) {
//     var list = json['unpaid_invoices'] as List;
//     List<Invoice> invoicesList = list.map((i) => Invoice.fromJson(i)).toList();

//     return UnpaidInvoicesData(
//       message: json['message'],
//       unpaidInvoices: invoicesList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'unpaid_invoices': unpaidInvoices.map((e) => e.toJson()).toList(),
//     };
//   }
// }

class UnpaidInvoicesModel {
  final int id;
  // final int courseId;
  final String value;
  final String dueDate;
  // final String createdAt;
  // final String updatedAt;
  final List<dynamic> payments;

  UnpaidInvoicesModel({
    required this.id,
    // required this.courseId,
    required this.value,
    required this.dueDate,
    // required this.createdAt,
    // required this.updatedAt,
    required this.payments,
  });

  factory UnpaidInvoicesModel.fromJson(Map<String, dynamic> json) {
    return UnpaidInvoicesModel(
      id: json['id'],
      // courseId: json['course_id'],
      value: json['value'],
      dueDate: json['due_date'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      payments: json['payments'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // 'course_id': courseId,
      'value': value,
      'due_date': dueDate,
      // 'created_at': createdAt,
      // 'updated_at': updatedAt,
      'payments': payments,
    };
  }
}
