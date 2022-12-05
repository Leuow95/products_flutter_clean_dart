import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:products_challenge/components/drawer.dart';
import 'package:products_challenge/features/home/domain/usecases/add_product_api_usecase.dart';
import 'package:products_challenge/features/home/external/datasource/products_api_datasource.dart';
import 'package:products_challenge/features/home/infra/repositories/product_repository_impl_v2.dart';
import 'package:products_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';
import 'package:products_challenge/features/home/domain/usecases/delete_product_api_usecase.dart';
import 'package:products_challenge/features/home/external/datasource/firebase_datasource_v2.dart';
import 'package:products_challenge/features/home/presenter/controllers/state/products_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  late final FirestoreDataSource imageService;

  @override
  void initState() {
    controller = HomeController(
      getProductsUsecase: GetProductApiUseCaseImpl(
          ProductRepositoryImplV2(ProductsApiDataSource(Dio()))),
      deleteProductUsecase: DeleteProductsUsecaseImpl(
          ProductRepositoryImplV2(ProductsApiDataSource(Dio()))),
      addProductUsecase: AddProductUsecaseImpl(
        ProductRepositoryImplV2(ProductsApiDataSource(Dio())),
      ),
    );
    controller.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .pushNamed("/add_product", arguments: controller),
      ),
      drawer: const CustomDrawer(),
      body: ValueListenableBuilder<ProductState>(
        valueListenable: controller,
        builder: (context, state, __) {
          if (state is ProductInitialState) {
            return const Center(child: Text("Estado inicial"));
          } else if (state is ProductFailureState) {
            return const Center(
              child: Text("Falha ao carregar os produtos"),
            );
          } else if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccessState) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.products.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => Material(
                elevation: 4,
                shadowColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.products[index].imageUrl,
                      alignment: Alignment.centerLeft,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(state.products[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "R\$ ${state.products[index].price.toStringAsFixed(2)}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => controller.deleteProductByIndex(
                            id: state.products[index].id!),
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(child: Text("Editar")),
                          PopupMenuItem(
                            child: const Text("Excluir"),
                            onTap: () => controller.deleteProductByIndex(
                                id: state.products[index].id!),
                          ),
                        ],
                      )
                    ],
                  ),
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
