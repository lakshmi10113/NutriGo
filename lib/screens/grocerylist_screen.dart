import 'package:flutter/material.dart';
import 'package:cook_bee/widgets/products_list.dart';
import 'package:cook_bee/screens/add_product_screen.dart';
import 'package:cook_bee/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GrocerylistScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _GrocerylistScreenState createState() => _GrocerylistScreenState();
}

class _GrocerylistScreenState extends State<GrocerylistScreen> {
  // Widget buildBottomSheet(BuildContext context) => Container();

  List<Product> products = [
    // Product(name: 'milk'),
    // Product(name: 'eggs'),
    // Product(name: 'spinach '),
  ];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _mProducts;

  void clearList() async {
    final SharedPreferences prefs = await _prefs;
    products.clear();
    await prefs.remove('mProducts');
  }

  Future<void> _incrementCounter(String newProduct) async {
    final SharedPreferences prefs = await _prefs;

    String strMProducts = prefs.getString('mProducts') ?? '';
    if (strMProducts != '') {
      newProduct = ', $newProduct';
    }

    final String mProducts = '${prefs.getString('mProducts') ?? ''}$newProduct';

    setState(() {
      _mProducts = prefs.setString('mProducts', mProducts).then((bool success) {
        return mProducts;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _mProducts = _prefs.then((SharedPreferences prefs) {
      String result = prefs.getString('mProducts') ?? '';

      if (result != '') {
        List<String> mProductsList = result.split(',');

        for (var i = 0; i < mProductsList.length; i++) {
          setState(() {
            products.add(Product(name: mProductsList[i]));
          });
        }
      }
      return result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddProductScreen((newProductTitle) {
                  setState(() {
                    products.add(Product(name: newProductTitle));
                    _incrementCounter(newProductTitle);
                  });
                  Navigator.pop(context);
                }),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 70.0, left: 30.3, right: 30.3, bottom: 30.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   radius: 20.0,
                //   child: Icon(Icons.list,
                //       size: 30.0, color: Colors.lightBlueAccent),
                // ),
                SizedBox(height: 12.2),
                const Text(
                  'Grocery List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
                // const Text(
                //   // '${products.length} Items',
                //   "5 Items",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //   ),
                // ),
                const SizedBox(height: 6.2),
                InkWell(
                  onTap: () => {
                    setState(() {
                      clearList();
                    })
                  },
                  child: const Text(
                    "Clear List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Center(
          //     child: FutureBuilder<String>(
          //         // future: _counter,
          //         future: _mProducts,
          //         builder:
          //             (BuildContext context, AsyncSnapshot<String> snapshot) {
          //           switch (snapshot.connectionState) {
          //             case ConnectionState.none:
          //             case ConnectionState.waiting:
          //               return const CircularProgressIndicator();
          //             case ConnectionState.active:
          //             case ConnectionState.done:
          //               if (snapshot.hasError) {
          //                 return Text('Error: ${snapshot.error}');
          //               } else {
          //                 return Text('${snapshot.data}');
          //               }
          //           }
          //         })),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ProductsList(products),
            ),
          )
        ],
      ),
    );
  }
}
