import 'package:flutter/material.dart';
import 'package:products_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:products_challenge/features/home/presenter/params/add_products_params.dart';

class AddProductsForm extends StatefulWidget {
  final HomeController homeController;
  const AddProductsForm({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<AddProductsForm> createState() => _AddProductsFormState();
}

class _AddProductsFormState extends State<AddProductsForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final descriptionController = TextEditingController();
  final filenameController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'What product do you want to add?',
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'What\'s the type of the product?',
                    labelText: 'Type',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Description of the Product?',
                    labelText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Product Image name?',
                    labelText: 'Filename',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'What\'s the height of the product?',
                    labelText: 'Height',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'What\'s the width of the product?',
                    labelText: 'Width',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'What\'s the price of the product?',
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'What\'s the rating of the product',
                    labelText: 'Rating',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.homeController.addProduct(
                    params: AddProductsParams(
                        title: nameController.text,
                        type: typeController.text,
                        description: descriptionController.text,
                        filename: filenameController.text,
                        height: int.tryParse(heightController.text) ?? 400,
                        width: int.tryParse(widthController.text) ?? 400,
                        price: double.tryParse(priceController.text) ?? 400,
                        rating: int.tryParse(ratingController.text) ?? 4),
                  );
                },
                child: const Text("Adicionar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
