abstract class CredentialsEntity {
  final String email;
  final String password;
  final String? userName;
  CredentialsEntity(
      {required this.email, required this.password, this.userName});
}
