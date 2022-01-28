import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void loadSplash(){
    Future.delayed(const Duration(seconds: 3), () {
       emit(SplashLoaded()) ;
    });
  }
}
