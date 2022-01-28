part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupProcessing extends SignupState{}

class SignupSuccess extends SignupState{}

class SignupFailed extends SignupState{
  String error;

  SignupFailed(this.error);
}
