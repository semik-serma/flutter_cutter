import 'package:flutter/material.dart';
import 'package:new_flutter_project/features/user/model/user_model.dart';
import 'package:new_flutter_project/widget/usercard.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final List<UserModel> users = [
    const UserModel(
      userId: 'user_001',
      name: 'Alice Smith',
      email: 'alice.smith@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_002',
      name: 'Bob Jones',
      email: 'bob.jones@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_003',
      name: 'Charlie Brown',
      email: 'charlie.brown@example.com',
      profileImageUrl: null,
    ),
    const UserModel(
      userId: 'user_004',
      name: 'Diana Prince',
      email: 'diana.prince@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_005',
      name: 'Evan Wright',
      email: 'evan.wright@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_006',
      name: 'Fiona Gallagher',
      email: 'fiona.gallagher@example.com',
      profileImageUrl: null,
    ),
    const UserModel(
      userId: 'user_007',
      name: 'George Clark',
      email: 'george.clark@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_008',
      name: 'Hannah Abbott',
      email: 'hannah.abbott@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=150&q=80',
    ),
    const UserModel(
      userId: 'user_009',
      name: 'Ian Malcolm',
      email: 'ian.malcolm@example.com',
      profileImageUrl: null,
    ),
    const UserModel(
      userId: 'user_010',
      name: 'Julia Roberts',
      email: 'julia.roberts@example.com',
      profileImageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List Screen")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width < 400
              ? 1
              : width < 700
              ? 2
              : width < 1100
              ? 3
              : 4;

          final aspectRatio = width < 400
              ? 0.65
              : width < 700
              ? 0.75
              : 0.8;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, index) {
              final user = users[index];
              return UserCard(
                user: user,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: Text(("User Details Screen"))),
                        body: Column(
                          children: [
                            Text(user.name),
                            Text(user.email),
                            Text(user.userId),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
