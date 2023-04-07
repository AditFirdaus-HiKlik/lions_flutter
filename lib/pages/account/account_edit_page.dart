// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/UserManager.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AccountEditPage extends StatefulWidget {
  const AccountEditPage({super.key});

  @override
  _AccountEditPageState createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  UserData userData = UserData();

  bool _isSaving = false;

  XFile? _image;

  @override
  void initState() {
    super.initState();

    userData = UserManager.userData.copyWith();
  }

  Future saveUser() async {
    setState(() {
      _isSaving = true;
    });

    if (_image != null) {
      try {
        File file = File(_image!.path);
        var response = await UserManager.uploadImage(file);

        userData.avatar.id = response[0]['id'];
      } catch (e) {
        log("Failed to upload image. Error: ${e}");
      }
    }

    UserManager.userData = userData.copyWith();

    var response = await UserManager.saveUser();

    setState(() {
      _isSaving = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Account',
        ),
        leading: BackButton(
          onPressed: _isSaving ? () {} : Navigator.of(context).pop,
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            onPressed: saveUser,
            icon: _isSaving
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(
                    Icons.save,
                  ),
            label: const Text(
              'Save',
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _renderProfile(),
                  const SizedBox(
                    height: 32,
                  ),
                  _renderContacts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderProfile() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
            height: 32,
          ),
          const SizedBox(
            height: 16,
          ),
          _avatarEdit(),
          const SizedBox(
            height: 32,
          ),
          _nameEdit(),
          const SizedBox(
            height: 16,
          ),
          _aboutEdit(),
          const SizedBox(
            height: 16,
          ),
          _birthDateEdit(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _renderContacts() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Contacts',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
            height: 32,
          ),
          const SizedBox(
            height: 16,
          ),
          _phoneEdit(),
          const SizedBox(
            height: 16,
          ),
          _addressEdit(),
          const SizedBox(
            height: 16,
          ),
          _instagramEdit(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _avatarEdit() {
    Widget avatarImage = (_image != null)
        ? Image.file(
            File(_image!.path),
            fit: BoxFit.cover,
          )
        : Image.network(
            userData.avatar.url,
            fit: BoxFit.cover,
          );
    return ZoomTapAnimation(
      onTap: _isSaving
          ? () {}
          : () async {
              final ImagePicker picker = ImagePicker();
              _image = await picker.pickImage(
                source: ImageSource.gallery,
              );
              setState(() {});
            },
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: avatarImage,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Edit Avatar',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameEdit() {
    return TextFormField(
      initialValue: userData.name,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (String value) {
        userData.name = value;
      },
    );
  }

  Widget _aboutEdit() {
    return TextFormField(
      initialValue: userData.about,
      decoration: const InputDecoration(
        labelText: 'About',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      minLines: 3,
      maxLines: 5,
      onChanged: (String value) {
        userData.about = value;
      },
    );
  }

  Widget _phoneEdit() {
    return TextFormField(
      initialValue: userData.phone,
      decoration: const InputDecoration(
        labelText: 'Phone',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (String value) {
        userData.phone = value;
      },
    );
  }

  Widget _birthDateEdit() {
    return ZoomTapAnimation(
      end: 1.1,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: userData.birthDate,
          firstDate: DateTime(1900, 1),
          lastDate: DateTime(2100),
        );
        if (picked != null && picked != userData.birthDate) {
          setState(() {
            userData.birthDate = picked;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Birth Date',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
            Text(
              DateFormat('dd MMMM yyyy').format(userData.birthDate),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressEdit() {
    return TextFormField(
      initialValue: userData.address,
      decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (String value) {
        userData.address = value;
      },
    );
  }

  Widget _instagramEdit() {
    return TextFormField(
      initialValue: userData.social.instagram,
      decoration: const InputDecoration(
        labelText: '@ Instagram',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (String value) {
        userData.social.instagram = value;
      },
    );
  }
}
