import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tezda_assessent_task/bloc/auth_cubit.dart';
import 'package:tezda_assessent_task/config/app_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationCubit? authenticationCubit;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // authenticationCubit = context.read<AuthenticationCubit>();
    super.initState();
  }

  Future<void> _signIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        // await authenticationCubit?.signIn(
        //   _emailController.text,
        //   _passwordController.text,
        // );
        GoRouter.of(context).push(Routes.productListing);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? "Authentication failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> _signUp() async {
    try {
      if (_formKey.currentState!.validate()) {
        // await authenticationCubit?.signUp(
        //   _emailController.text,
        //   _passwordController.text,
        // );
        GoRouter.of(context).push(Routes.productListing);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? "Registration failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 120, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address.';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.password_outlined),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password.';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: _signIn,
                label: const Text("Sign In"),
                icon: const Icon(Icons.login_outlined),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: _signUp,
                icon: const Icon(Icons.add_circle_outline_outlined),
                label: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
