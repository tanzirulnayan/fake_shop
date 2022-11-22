part of 'add_product_bloc.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  const AddProductSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class AddProductFailed extends AddProductState {
  const AddProductFailed({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
