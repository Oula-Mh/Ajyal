import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginationTestPage extends StatefulWidget {
  const PaginationTestPage({super.key});

  @override
  State<PaginationTestPage> createState() => _PaginationTestPageState();
}

class _PaginationTestPageState extends State<PaginationTestPage> {
  int _currentPage = 1;
  final int _perPage = 10;
  late List<CourseAdvModelTest> _allData;
  late List<CourseAdvModelTest> _currentPageData;
  late int _lastPage;

  @override
  void initState() {
    super.initState();
    _allData = _generateFakeData(50); // توليد 50 دورة وهمية
    _lastPage = (_allData.length / _perPage).ceil();
    _setCurrentPageData();
  }

  List<CourseAdvModelTest> _generateFakeData(int totalItems) {
    return List.generate(totalItems, (index) {
      return CourseAdvModelTest(
        id: index + 1,
        title: 'الدورة رقم ${index + 1}',
        body: 'وصف مختصر للدورة رقم ${index + 1}',
      );
    });
  }

  void _setCurrentPageData() {
    final start = (_currentPage - 1) * _perPage;
    final end = (_currentPage * _perPage).clamp(0, _allData.length);
    _currentPageData = _allData.sublist(start, end);
    setState(() {});
  }

  void _onPageChanged(int page) {
    _currentPage = page;
    _setCurrentPageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة التجريب')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _currentPageData.length,
              itemBuilder: (context, index) {
                final item = _currentPageData[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.body),
                );
              },
            ),
          ),
          ResponsivePaginationBar(
            paginationModel: AdvPaginationModelTest(
              currentPage: _currentPage,
              lastPage: _lastPage,
              data: _currentPageData,
            ),
            onPageChanged: _onPageChanged,
          ),
        ],
      ),
    );
  }
}

class ResponsivePaginationBar extends StatelessWidget {
  final AdvPaginationModelTest paginationModel;
  final void Function(int page) onPageChanged;

  const ResponsivePaginationBar({
    super.key,
    required this.paginationModel,
    required this.onPageChanged,
  });

  Widget _navButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: enabled ? Colors.black87 : Colors.grey),
      onPressed: enabled ? onTap : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = paginationModel.lastPage;
    int currentPage = paginationModel.currentPage;
    int maxButtons = 5;

    int start = (currentPage - (maxButtons ~/ 2)).clamp(
      1,
      totalPages - maxButtons + 1,
    );
    int end = (start + maxButtons - 1).clamp(start, totalPages);

    List<Widget> buttons = [];

    buttons.add(
      _navButton(
        icon: Icons.first_page,
        enabled: currentPage > 1,
        onTap: () => onPageChanged(1),
      ),
    );

    buttons.add(
      _navButton(
        icon: Icons.chevron_left,
        enabled: currentPage > 1,
        onTap: () => onPageChanged(currentPage - 1),
      ),
    );

    for (int i = start; i <= end; i++) {
      bool isCurrent = i == currentPage;
      buttons.add(
        GestureDetector(
          onTap: () => onPageChanged(i),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCurrent ? Colors.blue : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '$i',
              style: TextStyle(
                color: isCurrent ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    buttons.add(
      _navButton(
        icon: Icons.chevron_right,
        enabled: currentPage < totalPages,
        onTap: () => onPageChanged(currentPage + 1),
      ),
    );

    buttons.add(
      _navButton(
        icon: Icons.last_page,
        enabled: currentPage < totalPages,
        onTap: () => onPageChanged(totalPages),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons,
      ),
    );
  }
}

class CourseAdvModelTest {
  final int id;
  final String title;
  final String body;

  CourseAdvModelTest({
    required this.id,
    required this.title,
    required this.body,
  });
}

class AdvPaginationModelTest {
  final int currentPage;
  final int lastPage;
  final List<CourseAdvModelTest> data;

  AdvPaginationModelTest({
    required this.currentPage,
    required this.lastPage,
    required this.data,
  });
}
