class Product {
  final String name;
  bool isDone;
  // final String quantity;

  Product({
    required this.name,
    this.isDone = false,
    // required this.quantity,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
