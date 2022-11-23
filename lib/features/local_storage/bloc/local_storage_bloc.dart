import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_event.dart';
part 'local_storage_state.dart';

class LocalStorageBloc extends Bloc<LocalStorageEvent, LocalStorageState> {
  LocalStorageBloc() : super(LocalStorageInitial()) {
    on<AddFoodOnTap>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('foodName', event.food);
      emit(FoodNameSaved());
    });

    on<ViewFoodOnTap>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final food = prefs.getString('foodName');
      emit(FoodNameLoaded(food!));
    });
  }
}
