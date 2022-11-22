import 'package:fake_shop/features/add_product/view/add_product_page.dart';
import 'package:fake_shop/features/home/bloc/home_bloc.dart';
import 'package:fake_shop/features/product_details/view/product_details_page.dart';
import 'package:fake_shop/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  Widget buildProductItem({
    required BuildContext context,
    required Product product,
    required List<Product> productList,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              product.title.toString(),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(
                  DeleteProductOnTap(
                    id: product.id ?? -1,
                    products: productList,
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).canvasColor,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsPage.routeName,
                arguments: product,
              );
            },
            child: Image.network(
              product.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          width: double.infinity,
          child: Column(
            children: [
              BlocConsumer<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    BlocProvider.of<HomeBloc>(context)
                        .add(const HomePageOnLoad());
                  }
                  if (state is HomeLoading) {
                    return const LinearProgressIndicator();
                  }
                  if (state is HomeSuccess) {
                    return Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: state.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (ctx, i) => buildProductItem(
                            context: context,
                            product: state.productList.elementAt(i),
                            productList: state.productList,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is HomeFailed) {
                    return Text(state.error.errorMessage);
                  }
                  return Container();
                },
                listener: (context, state) {},
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddProductPage.routeName,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
