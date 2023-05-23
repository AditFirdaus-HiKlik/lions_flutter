import 'package:flutter/material.dart';
import 'package:lions_flutter/models/member_social/member_social.dart';

// ignore: must_be_immutable
class SocialEditCard extends StatefulWidget {
  SocialEditCard(this.memberSocial, {Key? key, required this.onEdit})
      : super(key: key);

  MemberSocial memberSocial;
  final Function(MemberSocial) onEdit;

  @override
  State<SocialEditCard> createState() => _SocialEditCardState();
}

class _SocialEditCardState extends State<SocialEditCard> {
  TextEditingController _platformController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _platformController.text = widget.memberSocial.platform;
    _valueController.text = widget.memberSocial.value;
    _isVisible = widget.memberSocial.visible;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextField(
          controller: _platformController,
          decoration: const InputDecoration(
            hintText: 'Platform',
          ),
          onChanged: (value) {
            widget.memberSocial = widget.memberSocial.copyWith(
              platform: value,
            );
          },
        ),
        subtitle: TextField(
          controller: _valueController,
          decoration: const InputDecoration(
            hintText: 'Value',
          ),
          onChanged: (value) {
            widget.memberSocial = widget.memberSocial.copyWith(
              value: value,
            );
          },
        ),
        trailing: Switch(
          value: _isVisible,
          onChanged: (value) {
            setState(() {
              _isVisible = value;
              widget.memberSocial = widget.memberSocial.copyWith(
                visible: value,
              );
            });
          },
        ),
      ),
    );
  }
}
