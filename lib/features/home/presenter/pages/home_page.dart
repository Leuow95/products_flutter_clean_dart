import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:products_challenge/features/home/domain/usecases/add_product_api_usecase.dart';
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

  @override
  void initState() {
    controller = HomeController(
      getProductsUsecase: GetProductApiUseCaseImpl(
        ProductRepositoryImplV2(FirestoreDataSource()),
      ),
      deleteProductUsecase: DeleteProductsUsecaseImpl(
          ProductRepositoryImplV2(FirestoreDataSource())),
      addProductUsecase: AddProductUsecaseImpl(
        ProductRepositoryImplV2(FirestoreDataSource()),
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
      body: ValueListenableBuilder<ProductState>(
        valueListenable: controller,
        builder: (context, state, __) {
          if (state is ProductInitialState) {
            return const Center(child: Text("Funcionou nao"));
          } else if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccessState) {
            return ListView.builder(
              itemExtent: 80,
              itemCount: state.products.length,
              itemBuilder: (context, index) => ListTile(
                visualDensity: const VisualDensity(vertical: 2),
                leading: ClipRRect(
                  child: Image.asset(
                    "assets/images/${state.products[index].filename}",
                    alignment: Alignment.centerLeft,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(state.products[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.products[index].type),
                    RatingBar.builder(
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      ignoreGestures: true,
                      itemSize: 20,
                      initialRating: state.products[index].rating.toDouble(),
                      allowHalfRating: true,
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(child: Text("Editar")),
                        PopupMenuItem(
                          child: const Text("Excluir"),
                          onTap: () => controller.deleteProductByIndex(
                              id: state.products[index].id!),
                        ),
                      ],
                    ),
                    const Text("R\$ 20,00")
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
