class UserModel {
  final String userId;
  final String name;
  final String email;
  final String? profileImageUrl;

  const UserModel({
    required this.userId,
    required this.name,
    required this.email,
    this.profileImageUrl,
  });
}
