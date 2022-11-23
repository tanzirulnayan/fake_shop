part of 'local_storage_bloc.dart';

abstract class LocalStorageEvent extends Equatable {
  const LocalStorageEvent();

  @override
  List<Object> get props => [];
}

class AddFoodOnTap extends LocalStorageEvent {
  const AddFoodOnTap({required this.food});

  final String food;

  @override
  List<Object> get props => [food];
}

class ViewFoodOnTap extends LocalStorageEvent {
  const ViewFoodOnTap();

  @override
  List<Object> get props => [];
}
