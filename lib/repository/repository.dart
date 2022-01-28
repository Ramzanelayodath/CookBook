

import 'package:cookbook/network/network_service.dart';

class Repository{
   final NetworkService networkService;

   Repository(this.networkService);

  Future<dynamic> doRegister(String firstName,String lastName,String email,String passWord)async{
    return networkService.doRegister(firstName, lastName, email, passWord);
  }

  Future<dynamic> doLogin(String email,String password)async{
     return networkService.doLogin(email, password);
  }

  void getRecipe()async{
    return networkService.getRecipe();
  }
}