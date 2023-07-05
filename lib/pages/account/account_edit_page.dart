// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/pages/club_select_page.dart';
import 'package:lions_flutter/pages/district_select_page.dart';
import 'package:lions_flutter/pages/position_select_page.dart';
import 'package:lions_flutter/services/account_service/account_service.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AccountEditPage extends StatefulWidget {
  AccountEditPage(this.account);

  Account account;

  @override
  _AccountEditPageState createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  bool _isSaving = false;

  XFile? _image;

  @override
  void initState() {
    super.initState();
  }

  Future saveUser() async {
    setState(() {
      _isSaving = true;
    });

    if (_image != null) {
      try {
        File file = File(_image!.path);
      } catch (e) {
        log("Failed to upload image. Error: $e");
      }
    }

    await AccountService.setAccount(widget.account);

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
                  ZoomTapAnimation(
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
                              child: (_image != null)
                                  ? Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      widget.account.avatar.url,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Edit Avatar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.blue,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: widget.account.memberID,
                    decoration: const InputDecoration(
                      labelText: 'Member ID',
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
                      widget.account = widget.account.copyWith(
                        memberID: value,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: widget.account.name,
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
                      // userData.name = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: widget.account.about,
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
                      // userData.about = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: const Text(
                      'Position',
                    ),
                    subtitle: Text(
                      widget.account.position.title != ""
                          ? widget.account.position.title
                          : 'No Position',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      onPressed: _editPosition,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'District',
                    ),
                    subtitle: Text(
                      widget.account.district.title != ""
                          ? widget.account.district.title
                          : 'No District',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      onPressed: _editDistrict,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Club',
                    ),
                    subtitle: Text(
                      widget.account.club.title != ""
                          ? widget.account.club.title
                          : 'No Club',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      onPressed: _editClub,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: Text(
                      'Contacts',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: widget.account.address,
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
                      widget.account = widget.account.copyWith(
                        phone: value,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    initialValue: widget.account.address,
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
                      widget.account = widget.account.copyWith(
                        address: value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Edit Position
  Future _editPosition() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PositionSelectPage(
          selectedPosition: widget.account.position,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        widget.account = widget.account.copyWith(
          position: result,
        );
      });
    }
  }

  // Edit District
  Future _editDistrict() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DistrictSelectPage(
          selectedDistrict: widget.account.district,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        widget.account = widget.account.copyWith(
          district: result,
        );
      });
    }
  }

  // Edit Club
  Future _editClub() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClubSelectPage(
          selectedClub: widget.account.club,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        widget.account = widget.account.copyWith(
          club: result,
        );
      });
    }
  }
}
