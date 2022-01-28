import 'package:bloc/bloc.dart';
import 'package:cookbook/repository/repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;
  HomeCubit(this.repository) : super(HomeInitial());

  void getRecipe(){
    repository.getRecipe();
  }
}
