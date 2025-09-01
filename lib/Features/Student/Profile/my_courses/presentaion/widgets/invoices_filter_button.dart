import 'package:flutter/material.dart';

// class FilterButton extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   const FilterButton({
//     super.key,
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(
//           color: selected ? Colors.black87 : Colors.grey.shade400,
//           width: selected ? 2 : 1,
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//       ),
//       onPressed: onTap,
//       child: Text(
//         label,
//         style: TextStyle(
//           color: Colors.black87,
//           fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
// }

class FilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double textScale;

  const FilterButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.textScale,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: selected ? Colors.black87 : Colors.grey.shade400,
          width: selected ? 2 : 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20 * textScale),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16 * textScale,
          vertical: 8 * textScale,
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14 * textScale,
        ),
      ),
    );
  }
}
