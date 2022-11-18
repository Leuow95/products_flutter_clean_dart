import 'package:flutter/material.dart';
import 'package:products_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';
import 'package:products_challenge/features/home/domain/usecases/delete_product_api_usecase.dart';
import 'package:products_challenge/features/home/external/datasource/firebase_datasource_v2.dart';
import 'package:products_challenge/features/home/infra/repositories/product_repository_impl.dart';
import 'package:products_challenge/features/home/presenter/controllers/state/products_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    controller = HomeController(
        getProductsUsecase: GetProductApiUseCaseImpl(
          ProductRepositoryImpl(
            FirestoreDataSource(),
          ),
        ),
        deleteProductUsecase: DeleteProductsUsecaseImpl(
            ProductRepositoryImpl(FirestoreDataSource())));
    controller.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: ValueListenableBuilder<ProductState>(
        valueListenable: controller,
        builder: (context, state, __) {
          if (state is ProductInitialState) {
            return const Center(child: Text("Funcionou nao"));
          } else if (state is ProductLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is ProductSuccessState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) => ListTile(
                leading: ClipRRect(
                  child: Image.asset(
                    "assets/images/${state.products[index].filename}",
                    alignment: Alignment.centerLeft,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(state.products[index].title),
                subtitle: Text(state.products[index].type),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(child: Text("Editar")),
                    PopupMenuItem(
                      child: const Text("Excluir"),
                      onTap: () => controller.deleteProductByIndex(index),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
