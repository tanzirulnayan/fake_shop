import 'package:fake_shop/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: SizedBox(
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
                        return Text(state.resStr);
                      }
                      if (state is HomeFailed) {
                        return Text(state.msg);
                      }
                      return Container();
                    },
                    listener: (context, state) {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
