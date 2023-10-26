import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final bool isChecked;
  final String productTitle;
  // final String productQuantity;
  final void Function(bool?) checkboxCallback;

  ProductTile(
      {required this.isChecked,
      required this.productTitle,
      // required this.productQuantity,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        productTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      // subtitle: Text(productQuantity),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? true;
// });
