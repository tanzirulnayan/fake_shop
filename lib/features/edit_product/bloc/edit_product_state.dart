part of 'edit_product_bloc.dart';

abstract class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductSuccess extends EditProductState {
  const EditProductSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class EditProductFailed extends EditProductState {
  const EditProductFailed({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
