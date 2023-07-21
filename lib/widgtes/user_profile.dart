import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userImage;

  const UserProfile({
    required this.userName,
    required this.userEmail,
    required this.userImage,
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      width: double.infinity,
      color: Colors.grey[100],
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.userImage),
            child: widget.userImage.isEmpty
                ? const Icon(Icons.person_2_outlined)
                : null,
          ),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(widget.userEmail),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
