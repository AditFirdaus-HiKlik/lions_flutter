// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lions_flutter/Pages/Auth/register_page.dart';
import 'package:lions_flutter/Pages/Auth/verification_page.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/pages/auth/recovery_page.dart';
import 'package:lions_flutter/sports_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();

  bool _submitting = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAppIcon(),
                    const SizedBox(height: 32),
                    _buildHeader(),
                    const SizedBox(height: 32),
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 8),
                    _buildForgotPasswordButton(),
                    const SizedBox(height: 8),
                    _buildLoginButton(),
                    const SizedBox(height: 8),
                    _buildRegisterButton(),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    _buildBottomText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ? Logic Section
  Future login() async {
    setState(() => _submitting = true);

    try {
      if (_key.currentState!.validate()) {
        var endpoint = "$apiEndpoint/auth/local";

        var response = await http.post(Uri.parse(endpoint), body: {
          "identifier": emailController.text,
          "password": passwordController.text
        });

        var body = jsonDecode(response.body);

        var bodyJwt = body['jwt'];
        var bodyUser = body['user'];
        var bodyError = body['error'];

        if (bodyError != null) {
          var errorMessage = bodyError['message'];

          if (errorMessage == "Your account email is not confirmed") {
            _navigateToVerificationPage();
          } else {
            scaffoldMessage(context, errorMessage);
          }
        }

        if (bodyJwt != null) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      log(e.toString());
    }

    setState(() => _submitting = false);
  }

  // ? Route Section
  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      PageTransition(
        child: const RegisterPage(),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  void _navigateToRecoveryPage() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: const RecoveryPage(),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  void _navigateToVerificationPage() {
    Navigator.push(
      context,
      PageTransition(
        child: VerificationPage(
          email: emailController.text,
          password: passwordController.text,
        ),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  // ? UI Section
  Widget _buildAppIcon() {
    return Center(
      child: Container(
        width: 96,
        height: 96,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          image: DecorationImage(
            image: AssetImage('assets/icon-sports.png'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 16.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      // IOS Style Text Input Decoration
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'Enter your email',
        labelText: 'Email',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) return "Email is required";

        if (!value.contains('@')) return "Please enter a valid email";

        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Enter your password',
        labelText: 'Password',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) return "Password is required";

        return null;
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _submitting ? null : _navigateToRecoveryPage,
        child: const Text('Forgot Password?'),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton.icon(
        onPressed: _submitting ? null : login,
        icon: const Icon(Icons.login),
        label: Text(_submitting ? 'Logging in...' : 'Login'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ));
  }

  Widget _buildRegisterButton() {
    return TextButton.icon(
      onPressed: _submitting ? null : _navigateToRegisterPage,
      icon: const Icon(Icons.person_add_alt_1),
      label: const Text('Register'),
    );
  }

  Widget _buildBottomText() {
    return Column(
      children: const [
        Text(
          'Indonesian Sports On Community 2023',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '© 2023 Indonesian Sports On Community',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'All rights reserved',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
