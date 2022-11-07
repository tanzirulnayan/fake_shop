import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/core/clients/shop_client.dart';
import 'package:fake_shop/models/common/error_model.dart';
import 'package:fake_shop/models/product/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomePageOnLoad>((event, emit) async {
      emit(const HomeLoading());

      final res = await _shopClient.getProducts();

      if (res.hasError) {
        emit(
          HomeFailed(
            error: ErrorModel(
              hasError: res.hasError,
              errorType: res.errorType,
              errorMessage: res.errorMessage,
            ),
          ),
        );
      } else {
        emit(
          HomeSuccess(productList: res.productList),
        );
      }
    });
  }
  final _shopClient = ShopClient();
}
