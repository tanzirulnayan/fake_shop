import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/core/clients/shop_client.dart';
import 'package:fake_shop/models/product/product.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductOnTap>((event, emit) async {
      emit(AddProductLoading());

      final res = await _shopClient.addProduct(prod: event.product);

      if (res.hasError) {
        emit(
          AddProductFailed(
            message: res.errorMessage,
          ),
        );
      } else {
        emit(
          const AddProductSuccess(
            message: 'Product added successfully',
          ),
        );
      }
    });
  }
  final _shopClient = ShopClient();
}
