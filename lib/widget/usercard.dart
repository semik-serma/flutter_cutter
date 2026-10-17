import 'package:flutter/material.dart';
import 'package:new_flutter_project/features/user/model/user_model.dart';
import 'package:new_flutter_project/trash/typography/typhography.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;
  const UserCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    user.profileImageUrl ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) {
                      return Icon(Icons.person);
                    },
                  ),
                  Positioned(
                    bottom: 4,
                    left: 50,
                    child: Text(
                      user.name,
                      style: AppTypography.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
