import 'package:cookbook/login/cubit/login_cubit.dart';
import 'package:cookbook/util/router_vairables.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
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
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginProcessing) {
          progressDialog.showProgressDialog(context);
        } else if (state is LoginSuccess) {
          progressDialog.dismissProgressDialog(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, home);
        } else if (state is LoginFailed) {
          progressDialog.dismissProgressDialog(context);
          showSnackBar(state.error, context);
        }
      },
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [header(), inputFiled(context), footer(context)],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(mainAxisSize: MainAxisSize.max, children: const [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Welcome',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 3,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Back',
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
              'Sign in',
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
                BlocProvider.of<LoginCubit>(context).doLogin(
                    ctrl_email.text.toString(), ctrl_password.text.toString());
               /* Navigator.pop(context);
                Navigator.pushNamed(context, home); */
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
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('Dont have an account?'),
        ),
        const SizedBox(
          height: 3,
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            child: const Text(
              'Register Here',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, signup);
            },
          ),
        )
      ],
    );
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
