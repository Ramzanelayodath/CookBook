

import 'package:cookbook/addrecipie/add_recipe_screem.dart';
import 'package:cookbook/addrecipie/cubit/add_recipe_cubit.dart';
import 'package:cookbook/home/cubit/home_cubit.dart';
import 'package:cookbook/home/home_screen.dart';
import 'package:cookbook/itemdetails/cubit/item_details_cubit.dart';
import 'package:cookbook/itemdetails/item_details.dart';
import 'package:cookbook/login/cubit/login_cubit.dart';
import 'package:cookbook/login/login_screen.dart';
import 'package:cookbook/network/network_service.dart';
import 'package:cookbook/repository/repository.dart';
import 'package:cookbook/signup/cubit/signup_cubit.dart';
import 'package:cookbook/signup/signup_screen.dart';
import 'package:cookbook/splash_screen/cubit/splash_cubit.dart';
import 'package:cookbook/splash_screen/splash_screen.dart';
import 'package:cookbook/util/router_vairables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renovation_core/core.dart';

class AppRouter{
  late Repository repository;
  late Renovation renovationInstance;
  AppRouter(this.renovationInstance) {
    repository = Repository(NetworkService(renovationInstance));

  }

  Route? generateRoute(RouteSettings settings){
   switch(settings.name){
     case '/' :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) =>SplashCubit(),
         child: SplashScreen(),
       ));
     case login :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) =>LoginCubit(repository),
         child: LoginScreen(),
       ));
     case signup :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) =>SignupCubit(repository),
         child: SignupScreen(),
       ));
     case home :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) => HomeCubit(repository),
         child: HomeScreen(),
       ));
     case item_details :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) => ItemDetailsCubit(),
         child: ItemDetails(),
       ));
     case add_item :
       return MaterialPageRoute(builder: (_) => BlocProvider(
         create: (BuildContext context) => AddRecipeCubit(),
         child: AddRecipe(),
       ));
   }
  }
}