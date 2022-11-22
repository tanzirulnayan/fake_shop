part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomePageOnLoad extends HomeEvent {
  const HomePageOnLoad();

  @override
  List<Object> get props => [];
}

class DeleteProductOnTap extends HomeEvent {
  const DeleteProductOnTap({required this.id, required this.products});

  final int id;
  final List<Product> products;

  @override
  List<Object> get props => [id, products];
}
