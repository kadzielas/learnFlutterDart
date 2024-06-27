import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.orange({super.key})
      : color1 = Colors.deepOrange,
        color2 = Colors.yellow;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

// final List<Color> colors;


//   @override
//   Widget build(context) {
//     return Container(
//       decoration:   BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             colors: colors;
//             // Color.fromARGB(255, 45, 7, 98),
//           ],
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('Styled text'),
//       ),
//     );
//   }
// }
