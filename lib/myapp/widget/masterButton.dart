import 'package:english1/app/view/app.dart';
import 'package:flutter/material.dart';

class MasterButton extends StatelessWidget {
  const MasterButton({Key? key, required this.list, required this.menuTitle})
      : super(key: key);
  final List<Widget> list;
  final String menuTitle;
  @override
  Widget build(BuildContext context) {
    final i = list.length * 2 - 1;
    return Scaffold(
        appBar: AppBar(
          title: Text(menuTitle),
        ),
        body: ListView.builder(
            itemCount: i,
            itemBuilder: (context, index) {
              if (index.isOdd) return const Divider();
              final item = index ~/ 2;
              return list[item];
            }));
  }
}
//   @override
//   Widget build(BuildContext context) {
//     final i = list.length * 2 - 1;

//     return AlertDialog(
//       content: SizedBox(
//         width: width,
//         height: height,
//         child: ListView.builder(
//             itemCount: i,
//             itemBuilder: (context, index) {
//                if (index.isOdd) return Divider();
        // final indexNumber = index ~/2;
        // return ListTile(
        //   title: Text("Number ${_numbers[indexNumber]}")
//             }),
//       ),
//     );
//   }
// }
