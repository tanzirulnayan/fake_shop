part of 'local_storage_bloc.dart';

abstract class LocalStorageState extends Equatable {
  const LocalStorageState();

  @override
  List<Object> get props => [];
}

class LocalStorageInitial extends LocalStorageState {}

class FoodNameSaved extends LocalStorageState {}

class FoodNameLoaded extends LocalStorageState {
  const FoodNameLoaded(this.food);

  final String food;
  @override
  List<Object> get props => [food];
}
