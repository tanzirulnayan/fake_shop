import 'package:fake_shop/features/home/bloc/home_bloc.dart';
import 'package:fake_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

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
                          itemBuilder: (ctx, i) => ProductItem(
                            product: state.productList.elementAt(i),
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
    );
  }
}
