import 'package:bloc/bloc.dart';
import 'package:cookbook/repository/repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  void doLogin(String email,String password){
     email.isEmpty ?
         emit(LoginFailed("Enter Email")) :
     password.isEmpty ?
         emit(LoginFailed("Enter Password")) :
     repository.doLogin(email, password).then((value){
        emit(LoginProcessing());
        if(value){
          emit(LoginSuccess());
        }else{
          emit(LoginFailed("Try again"));
        }
     });


  }
}

