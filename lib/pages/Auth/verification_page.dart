// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage(
      {super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool _checking = false;
  bool _sending = false;

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildCheckButton(),
                  _buildSendButton(),
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
    );
  }

  // Logic Section
  Future checkEmailVerification() async {
    setState(() => _checking = true);

    setState(() => _checking = false);
  }

  Future sendEmailVerification() async {
    setState(() => _sending = true);

    setState(() => _sending = false);
  }

  // UI Section
  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          'Verify Your Email',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'We have sent a verification link to your email',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckButton() {
    return ElevatedButton.icon(
        onPressed: _checking ? null : checkEmailVerification,
        icon: const Icon(Icons.check),
        label: Text(_checking ? 'Checking...' : 'Check'),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ));
  }

  Widget _buildSendButton() {
    return ElevatedButton.icon(
        onPressed: _sending ? null : sendEmailVerification,
        icon: const Icon(Icons.email),
        label: Text(_sending ? 'Sending...' : 'Send'),
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
