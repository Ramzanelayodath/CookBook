import 'package:bloc/bloc.dart';
import 'package:cookbook/repository/repository.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final Repository repository;
  SignupCubit(this.repository) : super(SignupInitial());

  void doRegister(String firstName,String lastName,String email,String password)async{
    emit(SignupProcessing());
    firstName.isEmpty ?
       emit(SignupFailed("Enter First Name")) :
    lastName.isEmpty ?
       emit(SignupFailed("Enter Last Name"))  :
    email.isEmpty ?
    emit(SignupFailed("Enter Email"))  :
    password.isEmpty ?
    emit(SignupFailed("Enter Password"))  :
    await repository.doRegister(firstName, lastName, email, password).then((value){
        if(value ){
          emit(SignupSuccess());
        }else{
          emit(SignupFailed("Try Again"));
        }
    });
  }
}
