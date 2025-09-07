import 'dart:math';

import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:flutter/material.dart';

class ResponsivePaginationBar extends StatefulWidget {
  final AdvPaginationModel paginationModel;
  final void Function(int page) onPageChanged;

  const ResponsivePaginationBar({
    super.key,
    required this.paginationModel,
    required this.onPageChanged,
  });

  @override
  State<ResponsivePaginationBar> createState() =>
      _ResponsivePaginationBarState();
}

class _ResponsivePaginationBarState extends State<ResponsivePaginationBar> {
  int startPage = 0;

  @override
  void didUpdateWidget(covariant ResponsivePaginationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // إعادة حساب startPage عندما تتغير currentPage
    int totalPages = widget.paginationModel.lastPage ?? 1;
    int maxButtons = _maxVisibleButtons();

    int newStart = max(
      0,
      (widget.paginationModel.currentPage ?? 1) - (maxButtons ~/ 2),
    );
    newStart = min(newStart, max(0, totalPages - maxButtons));

    startPage = newStart;
  }

  int _maxVisibleButtons() {
    return min(
      ((MediaQuery.of(context).size.width - 120) / 36).floor(),
      widget.paginationModel.lastPage ?? 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentPage = widget.paginationModel.currentPage ?? 1;
    int totalPages = widget.paginationModel.lastPage ?? 1;
    int maxVisibleButtons = _maxVisibleButtons();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _navButton(
          icon: Icons.first_page,
          enabled: currentPage > 1,
          onTap: () => widget.onPageChanged(1),
        ),
        _navButton(
          icon: Icons.navigate_before,
          enabled: currentPage > 1,
          onTap: () => widget.onPageChanged(currentPage - 1),
        ),
        ...List.generate(min(maxVisibleButtons, totalPages - startPage), (
          index,
        ) {
          int page = startPage + index + 1;
          bool isCurrent = page == currentPage;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => widget.onPageChanged(page),
              child: CircleAvatar(
                radius: 18,
                backgroundColor:
                    isCurrent ? AppColor.primaryColor : Colors.grey.shade300,
                child: Text(
                  '$page',
                  style: TextStyle(
                    color: isCurrent ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
        _navButton(
          icon: Icons.navigate_next,
          enabled: currentPage < totalPages,
          onTap: () => widget.onPageChanged(currentPage + 1),
        ),
        _navButton(
          icon: Icons.last_page,
          enabled: currentPage < totalPages,
          onTap: () => widget.onPageChanged(totalPages),
        ),
      ],
    );
  }

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
}
