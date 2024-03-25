import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        children: const [
          // TableRow(
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //   ),
          //   children:  [
          //     TableCell(
          //       child: Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text(
          //           'Column 1',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //     TableCell(
          //       child: Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text(
          //           'Column 2',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //     TableCell(
          //       child: Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text(
          //           'Column 3',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data 1'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data 2'),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Data 3'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
