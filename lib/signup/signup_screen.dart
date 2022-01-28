

import 'package:cookbook/signup/cubit/signup_cubit.dart';
import 'package:cookbook/util/router_vairables.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget{
  TextEditingController ctrl_first_name = TextEditingController();
  TextEditingController ctrl_last_name = TextEditingController();
  TextEditingController ctrl_email = TextEditingController();
  TextEditingController ctrl_password = TextEditingController();
  ProgressDialog progressDialog = ProgressDialog();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
        listener: (context,state){
          if(state is SignupFailed){
            progressDialog.dismissProgressDialog(context);
            showSnackBar(state.error, context);
          }else if(state is SignupSuccess){
            progressDialog.dismissProgressDialog(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, home);
          }else if(state is SignupProcessing){
            progressDialog.showProgressDialog(context);
          }
        },child: Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [header(), inputFiled(context), footer(context)],
        ),
      ),
    ),);
  }

  Widget header() {
    return Column(mainAxisSize: MainAxisSize.max, children: const [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Register Here',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),

    ]);
  }

  Widget inputFiled(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         TextField(
          controller: ctrl_first_name,
          decoration: const InputDecoration(
            hintText: 'First Name',
          ),

        ),
         const SizedBox(
          height: 8,
        ),
         TextField(
          controller: ctrl_last_name,
          decoration: const InputDecoration(
            hintText: 'Last Name',
          ),

        ),
        const SizedBox(
          height: 8,
        ),
         TextField(
          controller: ctrl_email,
          decoration: const InputDecoration(
            hintText: 'Email Address',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
         TextField(
          controller: ctrl_password,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                BlocProvider.of<SignupCubit>(context).doRegister(ctrl_first_name.text.toString(),
                    ctrl_last_name.text.toString(),
                    ctrl_email.text.toString(),
                    ctrl_password.text.toString());
              },
            )
          ],
        ),
      ],
    );
  }

  Widget footer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        const Align(
          alignment: Alignment.center,
          child: Text('Already have an account?'),
        ),
        const SizedBox(
          height: 3,
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            child: const Text(
              'Login Here',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, login);
            },
          ),
        )
      ],
    );
  }

  void showSnackBar(String message,BuildContext context){
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}