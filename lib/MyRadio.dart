// import 'package:flutter/material.dart';
// import 'main.dart';

// enum opsi { a1, a2, b1, b2 }

// class MyRadio extends StatelessWidget {
//   MyRadio(
//       {super.key,
//       required this.group,
//       required this.value,
//       required this.onChanged});

//   opsi value;
//   opsi? group;
//   Function(opsi)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//             child: RadioListTile<opsi>(
//           contentPadding: const EdgeInsets.only(left: 25.0, top: 0),
//           groupValue: group,
//           value: opsi.a1,
//           title: const Text('Baik / Good'),
//           onChanged: onChanged,
//         )),
//         Expanded(
//             child: RadioListTile<opsi>(
//           contentPadding: const EdgeInsets.only(top: 0.0, left: 0.0),
//           groupValue: group,
//           value: opsi.a2,
//           title: const Text('Tidak Baik / Not Good'),
//           onChanged: onChanged,
//         ))
//       ],
//     );
//   }
// }
