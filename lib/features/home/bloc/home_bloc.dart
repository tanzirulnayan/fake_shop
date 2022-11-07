import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_shop/core/dio_client.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomePageOnLoad>((event, emit) async {
      emit(const HomeLoading());
      final dioClient = DioClient();

      final responseStr = await dioClient.getProducts();

      if (responseStr.isNotEmpty) {
        emit(HomeSuccess(resStr: responseStr));
      } else {
        emit(const HomeFailed(msg: 'Oops! Something went wrong.'));
      }
    });
  }
}
