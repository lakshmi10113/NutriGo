import 'package:flutter/material.dart';
import 'package:cook_bee/widgets/product_tile.dart';
import 'package:cook_bee/models/product.dart';

class ProductsList extends StatefulWidget {
  final List<Product> products;
  ProductsList(this.products);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ProductTile(
          isChecked: widget.products[index].isDone,
          productTitle: widget.products[index].name,
          // productQuantity: widget.products[index].quantity,
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.products[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.products.length,
    );
  }
}
