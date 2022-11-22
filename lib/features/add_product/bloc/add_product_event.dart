part of 'add_product_bloc.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductOnTap extends AddProductEvent {
  const AddProductOnTap({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}
