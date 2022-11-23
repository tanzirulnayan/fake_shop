part of 'edit_product_bloc.dart';

abstract class EditProductEvent extends Equatable {
  const EditProductEvent();

  @override
  List<Object> get props => [];
}

class EditProductOnTap extends EditProductEvent {
  const EditProductOnTap({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}
