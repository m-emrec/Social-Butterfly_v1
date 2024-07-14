import '../../domain/entities/credentials_entity.dart';

class CredentialsModel extends CredentialsEntity {
  CredentialsModel({
    required String email,
    required String password,
    String? userName,
  }) : super(
          email: email,
          password: password,
          userName: userName,
        );
}
