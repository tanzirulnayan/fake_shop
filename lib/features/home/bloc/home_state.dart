part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  const HomeSuccess({required this.productList});

  final List<Product> productList;

  @override
  List<Object> get props => [productList];
}

class HomeFailed extends HomeState {
  const HomeFailed({required this.error});

  final ErrorModel error;

  @override
  List<Object> get props => [error];
}
