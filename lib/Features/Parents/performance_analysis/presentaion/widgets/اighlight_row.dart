import 'package:flutter/material.dart';

// class HighlightCardsRow extends StatelessWidget {
//   final List<Widget> highlightCards;

//   const HighlightCardsRow({super.key, required this.highlightCards});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children:
//             highlightCards
//                 .map(
//                   (card) => Padding(
//                     padding: const EdgeInsets.only(right: 12),
//                     child: SizedBox(width: 180, child: card),
//                   ),
//                 )
//                 .toList(),
//       ),
//     );
//   }
// }
class HighlightCardsRow extends StatelessWidget {
  final List<Widget> highlightCards;
  final double cardWidth;

  const HighlightCardsRow({
    super.key,
    required this.highlightCards,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          highlightCards
              .map((card) => SizedBox(width: cardWidth, child: card))
              .toList(),
    );
  }
}
