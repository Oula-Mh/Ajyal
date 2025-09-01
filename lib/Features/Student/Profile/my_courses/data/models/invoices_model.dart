class InvoicesModel {
  final List<CourseData> data;

  InvoicesModel({required this.data});

  factory InvoicesModel.fromJson(Map<String, dynamic> json) {
    return InvoicesModel(
      data: (json['data'] as List).map((e) => CourseData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}

class CourseData {
  final Course course;
  final List<Invoice> paidInvoices;
  final List<Invoice> unpaidInvoices;

  CourseData({
    required this.course,
    required this.paidInvoices,
    required this.unpaidInvoices,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      course: Course.fromJson(json['course']),
      paidInvoices:
          (json['paid_invoices'] as List)
              .map((e) => Invoice.fromJson(e))
              .toList(),
      unpaidInvoices:
          (json['unpaid_invoices'] as List)
              .map((e) => Invoice.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course': course.toJson(),
      'paid_invoices': paidInvoices.map((e) => e.toJson()).toList(),
      'unpaid_invoices': unpaidInvoices.map((e) => e.toJson()).toList(),
    };
  }
}

class Course {
  final int id;
  final String name;
  final String cost;
  final String type;
  final String startDate;
  final String endDate;
  final String code;
  final int capacity;
  final String createdAt;
  final String updatedAt;

  Course({
    required this.id,
    required this.name,
    required this.cost,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.code,
    required this.capacity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      type: json['type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      code: json['code'],
      capacity: json['capacity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cost': cost,
      'type': type,
      'start_date': startDate,
      'end_date': endDate,
      'code': code,
      'capacity': capacity,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Invoice {
  final int id;
  final int courseId;
  final String value;
  final String dueDate;
  final String createdAt;
  final String updatedAt;
  final List<Payment> payments;

  Invoice({
    required this.id,
    required this.courseId,
    required this.value,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.payments,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'],
      courseId: json['course_id'],
      value: json['value'],
      dueDate: json['due_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      payments:
          (json['payments'] as List).map((e) => Payment.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'value': value,
      'due_date': dueDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'payments': payments.map((e) => e.toJson()).toList(),
    };
  }
}

class Payment {
  final int id;
  final int registrationId;
  final int invoiceId;
  final String paymentDate;
  final String createdAt;
  final String updatedAt;

  Payment({
    required this.id,
    required this.registrationId,
    required this.invoiceId,
    required this.paymentDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      registrationId: json['registration_id'],
      invoiceId: json['invoice_id'],
      paymentDate: json['payment_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registration_id': registrationId,
      'invoice_id': invoiceId,
      'payment_date': paymentDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
