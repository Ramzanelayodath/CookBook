import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_recipe_state.dart';

class AddRecipeCubit extends Cubit<AddRecipeState> {
  AddRecipeCubit() : super(AddRecipeInitial());
}
