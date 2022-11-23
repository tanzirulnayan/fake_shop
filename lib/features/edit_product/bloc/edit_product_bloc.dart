import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/core/clients/shop_client.dart';
import 'package:fake_shop/models/product/product.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc() : super(EditProductInitial()) {
    on<EditProductOnTap>((event, emit) async {
      emit(EditProductLoading());

      final res = await _shopClient.editProduct(prod: event.product);

      if (res.hasError) {
        emit(
          EditProductFailed(
            message: res.errorMessage,
          ),
        );
      } else {
        emit(
          const EditProductSuccess(
            message: 'Product edited successfully',
          ),
        );
      }
    });
  }
  final _shopClient = ShopClient();
}
