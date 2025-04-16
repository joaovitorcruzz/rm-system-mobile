import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rm_systems_mobile/core/widgets/icon_button_circle_widget.dart';
import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';

class UserHeadWidget extends StatelessWidget {
  final UserEntity user;

  const UserHeadWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: user.profileImage.isNotEmpty ? NetworkImage(user.profileImage) : null,
                child: user.profileImage.isEmpty ? const Icon(Icons.person, size: 40) : null,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          IconButtonCircleWidget(
            icon: FontAwesomeIcons.pen,
            iconColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}