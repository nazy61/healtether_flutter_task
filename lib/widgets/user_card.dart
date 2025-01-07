import 'package:flutter/material.dart';

/// User Card
class UserCard extends StatelessWidget {
  final String name;
  final String email;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfffcf0d6),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(
            "https://avatar.iran.liara.run/username?username=$name",
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(email),
      ),
    );
  }
}
