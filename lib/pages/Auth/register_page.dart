// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/pages/home/home_page.dart';
import 'package:lions_flutter/services/account_service/account_service.dart';
import 'package:lions_flutter/sports_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();

  bool _submitting = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                    _buildHeader(),
                    const SizedBox(height: 32),
                    _buildUsernameField(),
                    const SizedBox(height: 16),
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 16),
                    _buildConfirmPasswordField(),
                    const SizedBox(height: 32),
                    _buildRegisterButton(),
                    const SizedBox(height: 16),
                    const Divider(
                      thickness: 1,
                      height: 32,
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
  Future register() async {
    setState(() => _submitting = true);

    try {
      if (_key.currentState!.validate()) {
        String errorCode = "";

        await AccountService.register(
          usernameController.text,
          emailController.text,
          passwordController.text,
        );

        if (await AccountService.isAuthenticated()) {
          _navigateToHomePage();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorCode),
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() => _submitting = false);
  }

  void _navigateToHomePage() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  // ? UI Section
  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Create an account to get started',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      controller: usernameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Enter your username',
        labelText: 'Username',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) return "Username is required";

        if (value.length < 3) return "Username must be at least 3 characters";

        return null;
      },
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

        if (value.length < 6) return "At least 6 characters";

        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
            .hasMatch(value))
          return "At least 1 uppercase, 1 lowercase, and 1 number";

        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Confirm your password',
        labelText: 'Confirm Password',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) return "Confirm your password";

        if (value != passwordController.text) return "Passwords do not match";

        return null;
      },
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton.icon(
        onPressed: _submitting ? null : register,
        icon: const Icon(Icons.login),
        label: Text(_submitting ? 'Registering...' : 'Register'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ));
  }

  Widget _buildBottomText() {
    return const Column(
      children: [
        Text(
          'Lions Club 307 B1 2023',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '© 2023 Lions Club 307 B1 2023',
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
