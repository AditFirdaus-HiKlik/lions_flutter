// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lions_flutter/api/api.dart';

import 'package:http/http.dart' as http;

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final _key = GlobalKey<FormState>();

  bool _submitting = false;

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                    const SizedBox(height: 32),
                    _buildHeader(),
                    const SizedBox(height: 32),
                    _buildEmailField(),
                    const SizedBox(height: 32),
                    _buildSubmitButton(),
                    const Divider(
                      thickness: 1,
                      height: 64,
                    ),
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

  // Logic Section
  Future sendResetLink() async {
    setState(() => _submitting = true);

    try {
      if (_key.currentState!.validate()) {
        var endpoint = "$apiEndpoint/auth/forgot-password";

        var response = await http.post(
          Uri.parse(endpoint),
          body: {
            "email": emailController.text,
          },
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reset link has been sent to your email'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to send reset link'),
            ),
          );
        }
      }
    } catch (e) {
      log(e.toString());
    }

    setState(() => _submitting = false);
  }

  // UI Section
  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'Recover your password',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Enter your email address to recover your password',
          textAlign: TextAlign.center,
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

  Widget _buildSubmitButton() {
    return ElevatedButton.icon(
        onPressed: _submitting ? null : sendResetLink,
        icon: const Icon(Icons.send),
        label: Text(_submitting ? 'Sending...' : 'Send'),
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
