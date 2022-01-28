

import 'package:renovation_core/core.dart';
import 'package:renovation_core/meta.dart';

class NetworkService {
  final Renovation renovationInstance;

  NetworkService(this.renovationInstance);

  Future<dynamic> doRegister(String firstName,String lastName,String email,String password)async{
    Map<String,String>args = {
       'first_name' : firstName,
       'last_name' : lastName,
       'email' : email,
       'password' : password
    };
    Map<String, dynamic> body = {
      'cmd':"cookbook_backend.api.signup",
      'args' : args,
    };
     await renovationInstance.call(body).then((value){
      return value.isSuccess;
    });


  }

  Future<dynamic> doLogin(String email,String password)async{
    final loginResponse = await getFrappeAuthController().login(
        email, password);

    return loginResponse.isSuccess;
  }

  void getRecipe()async{

    //var documentResponse = await renovationInstance.meta.d;
    RequestResponse<DocType> docMeta =
    await getFrappeMetaController().getDocMeta(doctype: "Recipe");

    if (docMeta.isSuccess) {
      print("Doc meta : ${docMeta.data}");
    } else {
      print(docMeta.error);
    }

  }


}