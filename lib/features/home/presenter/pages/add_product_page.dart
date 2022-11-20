import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../widgets/add_products_form.dart';

class AddProductPage extends StatelessWidget {
  final HomeController controller;
  const AddProductPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: AddProductsForm(
        homeController: controller,
      ),
    );
  }
}
