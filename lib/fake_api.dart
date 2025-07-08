// fake_api.dart
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';

class FakeApi {
  static Future<Map<String, dynamic>> getCourseAdv({
    required int page,
    int perPage = 3,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Generate fake data for 10 pages
    final totalItems = 30; // 10 pages * 3 items
    final totalPages = 10;

    List<CourseAdvModel> items = [];

    for (int i = 0; i < perPage; i++) {
      final itemNumber = (page - 1) * perPage + i + 1;
      if (itemNumber > totalItems) break;

      items.add(
        CourseAdvModel(
          id: itemNumber,
          title: 'الدورة رقم $itemNumber',
          body: 'وصف الدورة التدريبية رقم $itemNumber',
          createdAt: "2025-06-22T21:52:35.000000Z",
          images: [], // You can add fake images if needed
        ),
      );
    }

    return {
      'data': items.map((e) => e.toJson()).toList(),
      'pagination': {
        'current_page': page,
        'per_page': perPage,
        'total': totalItems,
        'last_page': totalPages,
      },
    };
  }
}
