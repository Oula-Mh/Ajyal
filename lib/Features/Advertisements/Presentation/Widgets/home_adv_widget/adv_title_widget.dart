import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewAllAdv extends StatelessWidget {
  final String router;
  final Object params;
  final String viewText;
  const ViewAllAdv({
    super.key,
    required this.router,
    required this.params,
    required this.viewText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).push(router, extra: params);
        },
        child: Text(
          viewText,
          style: TextStyle(color: Colors.blue, fontSize: 13),
        ),
      ),
    );
  }
}
